require_relative 'test_helper'

class TestController < Rhino::Controller
  def index
    "Hello!"
  end
end

class TestApp < Rhino::Application
  def get_controller_and_action(env)
    ["TestController", 'index']
  end
end

class RhinoAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    # BestQuotes::Application.new
    TestApp.new
  end

  def get_action
    get '/quotes/a_quote'

    assert last_response.ok?
    body = last_response.body
    assert body["Ruby Version"]
  end

end
