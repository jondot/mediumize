module Mediumize
  class StdoutPublisher
    def initialize(opts={})
      @renderer = Mediumize::Renderer.new(opts)
    end

    def publish(file)
      content = @renderer.render(File.read(file), file)
      puts content[:content]
      { :id => "id/dry-run", :url => "http://example.com/dry-run", :content => content }
    end

  end
end

