require 'rubygems'
require 'bundler'
Bundler.require

class Physicals < Sinatra::Application
  get '/' do
    'hi'
  end
end

run Physicals
