require "mediumize/version"
require "mediumize/renderer"
require "mediumize/medium_publisher"
require "mediumize/stdout_publisher"

module HashExt
  def slice(*keys)
    keys.map! { |key| convert_key(key) } if respond_to?(:convert_key, true)
    keys.each_with_object(self.class.new) { |k, hash| hash[k] = self[k] if has_key?(k) }
  end
end

Hash.send(:include, HashExt)
module Mediumize
end

