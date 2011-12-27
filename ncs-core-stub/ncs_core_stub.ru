require 'rubygems'
require 'bundler'
Bundler.setup

require 'sinatra'
class NCSCoreStub < Sinatra::Base
  get '/staff/:staff_id/contacts.json' do
    env['aker.check'].authentication_required!
    username = env['aker.check'].user.username
    if username
      content_type :json
      IO.read("contacts.json")
    else    
      403
    end
  end
end

require 'aker'
Aker.configure do
  authorities :cas
  ui_mode :cas
  central '/etc/nubic/bcsec-local.yml'
end

use Rack::Session::Cookie

Aker::Rack.use_in(self)

run NCSCoreStub