$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mediumize'
require 'vcr'
require 'minitest-vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
MinitestVcr::Spec.configure!

def fixture_content(file)
  File.read(fixture(file))
end

def fixture(file)
  File.expand_path("./fixtures/#{file}", File.dirname(__FILE__))
end

require 'minitest/autorun'
