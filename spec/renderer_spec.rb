require 'spec_helper'
require 'mediumize/renderer'

describe Mediumize::Renderer do
  let(:post){
    <<-EOF
content
    EOF
  }

  let(:frontmatter_post){
    <<-EOF
---
title: "post title"
---

content
    EOF
  }

  let(:post_with_images){
    <<-EOF
---
title: "post title"
---

content
<img src="/foo/bar" />
    EOF
  }
  

  it 'should render plainly' do
    r = Mediumize::Renderer.new
    result = r.render(post, "foo.md")
    result[:title].must_equal("content")
    result[:content_format].must_equal("html")
    result[:content].must_equal(<<-EOF)
<p>content</p>
    EOF
  end

  it 'should render with frontmatter title' do
    r = Mediumize::Renderer.new(:frontmatter => true)
    result = r.render(frontmatter_post, "foo.md")
    result[:title].must_equal("post title")
    result[:content_format].must_equal("html")
    result[:content].must_equal(<<-EOF)
<p>content</p>
    EOF
  end
  
  it 'should insert a headline' do
    r = Mediumize::Renderer.new(:headline => true, :frontmatter => true)
    result = r.render(frontmatter_post, "foo.md")
    result[:title].must_equal("post title")
    result[:content_format].must_equal("html")
    result[:content].must_equal(<<-EOF)
<h1>post title</h1>
<p>content</p>
    EOF
  end
  
end

