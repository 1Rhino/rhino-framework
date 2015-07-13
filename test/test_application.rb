require_relative 'test_helper'

class RhinoAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BestQuotes::Application.new
  end

  def test_get
    get '/'

    assert last_response, "404"
    body = last_response.body
    assert body["not found"]

  end

  def test_request_post
    get '/quotes/a_quote'

    assert last_response.ok?
    body = last_response.body
    assert body["Ruby Version"]
  end

end
