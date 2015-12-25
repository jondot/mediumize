require "github/markup"
require "mediumize/frontmatter"
require "nokogiri"

module Mediumize
  class Renderer
    def initialize(opts={})
      @opts = opts
      @normalizers = [
        Normalizers::Title.new
      ]
      if @opts[:base_url]
        @normalizers << Normalizers::Links.new(@opts[:base_url])
      end
    end

    def render(content, file, opts={})
      if(@opts[:frontmatter])
        content, meta = Frontmatter.parse(content)
        opts[:title] ||= meta["title"]
      end

      markup = GitHub::Markup.render(file, content)
      doc = Nokogiri::HTML(markup)

      @normalizers.each{|n| doc = n.normalize(doc) }

      doc.title = opts[:title] if opts[:title]
      {
         :title => doc.title,
         :content => doc.at('body').children.to_html,
         :content_format => "html"
      }
    end

  end
end

