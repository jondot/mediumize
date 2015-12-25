require 'spec_helper'
require 'mediumize/normalizers/links'
require 'nokogiri'

describe Mediumize::Normalizers::Links do
  let(:normalizer){ Mediumize::Normalizers::Links.new("http://resources.com") }
  it 'should normalize relative image links' do
    normalizer.normalize(
    Nokogiri::HTML('<html><body><div>partial link <img src="/images/logo.png" /></div></body></html>')
    ).to_html.must_equal(<<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html><body><div>partial link <img src="http://resources.com/images/logo.png">
</div></body></html>
EOF
)

    normalizer.normalize(
    Nokogiri::HTML('<html><body><div>partial link <img src="http://abs.com/images/logo.png" /></div></body></html>')
    ).to_html.must_equal(<<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html><body><div>partial link <img src="http://abs.com/images/logo.png">
</div></body></html>
EOF
)
  end

end
