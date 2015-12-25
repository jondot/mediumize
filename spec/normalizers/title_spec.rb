require 'spec_helper'
require 'mediumize/normalizers/title'
require 'nokogiri'

describe Mediumize::Normalizers::Title do
  let(:normalizer){ Mediumize::Normalizers::Title.new }
  it 'should normalize a title' do
    normalizer.normalize(
    Nokogiri::HTML('<html><body><div>partial link <img src="/images/logo.png" /></div></body></html>')
    ).title.must_equal("partial link")

    normalizer.normalize(
    Nokogiri::HTML('<html><head><title>foo bar</title></head><body><div>partial link <img src="http://abs.com/images/logo.png" /></div></body></html>')
    ).title.must_equal("foo bar")
  end

end

