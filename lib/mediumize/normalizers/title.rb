module Mediumize
  module Normalizers
    class Title
      def normalize(doc)
        unless doc.title
          doc.title = doc.text()[0..80].strip.chomp
        end
        doc
      end
    end
  end
end


