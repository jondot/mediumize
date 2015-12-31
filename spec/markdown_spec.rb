require 'spec_helper'
require 'mediumize/markdown'


describe Mediumize::Markdown do
  it "should do markdown and code highlights" do
    m = Mediumize::Markdown.new
    m.render(fixture_content('code-post.md'))
     .must_equal(fixture_content('code-post.md.res'))
  end
end

