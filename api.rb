require 'sinatra'
require 'sinatra/jsonp'
require 'multi_json'
require 'oj'

require './lib/zip_hash'

module Postman
  class API < Sinatra::Base
    helpers Sinatra::Jsonp

    # load data
    p 'Loading zip data...'
    zip_hash = ZipHash.new('./data/US.txt')
    p 'Done!'

    before do
      content_type 'application/json', :charset => 'utf-8'
    end

    error 403 do
      MultiJson.dump({ :error => 'Forbidden' })
    end

    error 404 do
      MultiJson.dump({ :error => 'Not Found' })
    end

    get '/ping' do
      jsonp {}
    end

    get '/:zip' do
      data = zip_hash.get(params[:zip])
      if data
        jsonp data
      else
        403
      end
    end
  end
end
