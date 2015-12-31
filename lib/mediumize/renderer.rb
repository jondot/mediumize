require "mediumize/frontmatter"
require "mediumize/markdown"
require "mediumize/normalizers/links"
require "mediumize/normalizers/title"

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
      @markdown = Markdown.new
    end

    def render(content, file, opts={})
      if(@opts[:frontmatter])
        content, meta = Frontmatter.parse(content)
        opts[:title] ||= meta["title"]
      end

      markup = @markdown.render(content)
      doc = Nokogiri::HTML(markup)

      @normalizers.each{|n| doc = n.normalize(doc) }

      doc.title = opts[:title] if opts[:title]
      if(@opts[:headline])
        doc.at('body').children.first.add_previous_sibling("<h1>#{doc.title}</h1")
      end

      {
         :title => doc.title,
         :content => doc.at('body').children.to_html,
         :content_format => "html"
      }
    end

  end
end

