require "rubygems"
require "bundler/setup"

require 'sinatra'

get '/staff/:staff_id/events.json' do
  content_type :json
  IO.read("events.json")
end

get '/staff/:netid/instruments/:instrument_id.json' do
  content_type :json
  IO.read("ks_with_uuid.json")
end