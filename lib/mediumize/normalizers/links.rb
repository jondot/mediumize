require 'uri'

module Mediumize
  module Normalizers
    class Links
      def initialize(base)
        @base = base
      end
      def normalize(doc)
        doc.css('img').select{|img| img.attr('src') }.each do |img|
          img.set_attribute("src", URI.join(@base, img.attr('src')))
        end
        doc
      end
    end
  end
end

