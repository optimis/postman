require 'sinatra'
require 'multi_json'
require 'oj'

require './lib/zip_hash'

module Postman
  class API < Sinatra::Base
    p 'Loading zip data...'
    zip_hash = ZipHash.new('./data/US.txt')
    p 'Done!'

    get '/:zip' do
      data = zip_hash.get(params[:zip])
      MultiJson.dump(data)
    end
  end
end
