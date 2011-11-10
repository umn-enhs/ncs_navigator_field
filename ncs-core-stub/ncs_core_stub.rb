require "rubygems"
require "bundler/setup"

require 'sinatra'

get '/staff/:staff_id/contacts.json' do
  content_type :json
  IO.read("contacts.json")
end

get '/staff/:netid/instruments/:instrument_id.json' do
  content_type :json
  IO.read("ks_with_uuid.json")
end