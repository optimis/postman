require 'sinatra'
require 'sinatra/json'

require './lib/zip_hash'

module Postman
  class API < Sinatra::Base
    p 'loading zip data...'
    zip_hash = ZipHash.new('./data/US.txt')

    get '/:zip' do
      data = zip_hash.get(params[:zip])
      json data
    end
  end
end
