require 'spec_helper'


describe Mediumize::Publisher do
  it "should publish",:vcr do
    p = Mediumize::Publisher.new(:token => "***secret***",
                                 :frontmatter => true)
    res = p.publish(fixture("frontmatter-post.md"))
    res.must_equal({:id=>"**id**", :url=>"https://medium.com/@jondot/**id**"})
  end
end
