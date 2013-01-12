require 'api'

require 'test/unit'
require 'rack/test'

require 'json'

ENV['RACK_ENV'] = 'test'

class ApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_returns_success_response
    get '/90293'

    response = JSON.parse(last_response.body)
    assert_equal 200, last_response.status
    assert_equal 'Playa Del Rey', response['city']
    assert_equal 'California', response['state']
    assert_equal 'CA', response['state-abbreviation']
  end

  def test_it_returns_error_response
    get '/notvalid'

    assert_not_equal 200, last_response.status
  end
end
