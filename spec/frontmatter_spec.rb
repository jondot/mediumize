require 'spec_helper'
require 'mediumize/frontmatter'

describe Mediumize::Frontmatter do
  it 'should parse frontmatter' do
    content, meta = Mediumize::Frontmatter.parse(<<EOF
---
layout: post
title: "post title"
date: 2015-10-01 11:51
comments: true
categories: 
---

content
EOF
)
    content.must_equal("content\n")
    meta.must_equal({"layout"=>"post", "title"=>"post title", "date"=>"2015-10-01 11:51", "comments"=>true, "categories"=>nil})
  end
end

