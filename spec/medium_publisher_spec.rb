require 'spec_helper'


describe Mediumize::MediumPublisher do
  it "should publish",:vcr do
    p = Mediumize::MediumPublisher.new(:token => "***secret***",
                                 :frontmatter => true)
    res = p.publish(fixture("frontmatter-post.md"))
    res.must_equal({:id=>"**id**", :url=>"https://medium.com/@jondot/**id**",:content=>{:title=>"a frontmatter post", :content=>"<p>This is a frontmatter with markdown\n* one\n* two</p>\n", :content_format=>"html"}})
  end
end
