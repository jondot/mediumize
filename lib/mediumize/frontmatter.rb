require 'yaml'

module Mediumize
  class Frontmatter
    YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m
    
    def self.parse(content)
      if content =~ YAML_FRONT_MATTER_REGEXP
        return $', YAML.load($1) if $'
      end
      raise "Cannot parse frontmatter file (#{content.length} chars):\n--start\n#{content[0..200]}\n--end\n"
    end
  end
end

