require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module Mediumize
  class Markdown
    class HTMLWithRouge < Redcarpet::Render::HTML
      include Rouge::Plugins::Redcarpet
    end
    def initialize
      @redcarpet = Redcarpet::Markdown.new(HTMLWithRouge,:fenced_code_blocks => true)
    end
    def render(content)
      @redcarpet.render(content)
    end
  end
end

