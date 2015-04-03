require_relative 'test_helper'

class RhinoAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BestQuotes::Application.new
  end

  def test_get_root
    get '/'

    assert_equal last_response.status, 404
    body = last_response.body
    assert body["page not found"]

  end

  def test_get_quote
    get '/quotes/a_quote'

    assert last_response.ok?
    body = last_response.body
    assert body["Ben Franklin"]
  end

  def test_get_error_400
    get '/some_thing/not_found'

    assert_equal last_response.status, 404
    assert last_response.body["page not found"]
  end

  def test_action_not_found
    get '/quotes/not_found'

    assert_equal last_response.status, 404
    assert last_response.body["action not found"]
  end

  def get_all_quotes
    get '/quotes/index'

    assert last_response.ok?
    body = last_response.body
    assert body["Ben Franklin"]
    assert body["Budda"]

  end

end
