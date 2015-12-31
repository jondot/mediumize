require "medium"


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
  class MediumPublisher
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
      { :id => data["id"], :url => data["url"], :content => content }
    end

    def fetch_me!
      @me ||= @client.users.me
    end
  end
end
