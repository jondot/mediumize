require "mediumize/version"
require "mediumize/frontmatter"
require "mediumize/normalizers/links"
require "mediumize/normalizers/title"
require "mediumize/renderer"
require "medium"

module HashExt
  def slice(*keys)
    keys.map! { |key| convert_key(key) } if respond_to?(:convert_key, true)
    keys.each_with_object(self.class.new) { |k, hash| hash[k] = self[k] if has_key?(k) }
  end
end

Hash.send(:include, HashExt)

# patch medium api, upstream fix
# with time, replace medium-sdk-ruby entirely
module Medium
  class Posts
    def create(user, opts)
      @client.post "users/#{user['data']['id']}/posts",
                   build_request_with(opts)
    end
  end
end

module Mediumize
  class Publisher
    def initialize(opts={})
      @opts = opts
      @renderer = Mediumize::Renderer.new(opts)
      @client = Medium::Client.new(:integration_token => opts[:token])
    end

    def publish(file)
      content = @renderer.render(File.read(file), file)
      fetch_me!
      
      res = @client.posts.create(@me, content.merge(:publish_status => "draft"))
      data = Medium::Client.validate(res)["data"]
      { :id => data["id"], :url => data["url"] }
    end

    def fetch_me!
      @me ||= @client.users.me
    end
  end
end

