require_relative 'test_helper'

class TestApp < Rhino::Application
end

class RhinoAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'

    p last_response.body
    assert last_response.ok?
    body = last_response.body
    assert body["Xicalo"]
  end

end
