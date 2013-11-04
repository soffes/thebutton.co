require 'json'

# Connect to Redis
if ENV['REDISTOGO_URL']
  uri = URI.parse(ENV['REDISTOGO_URL'])
  $redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
else
  $redis = Redis.new
end

class TheButtonCo < Sinatra::Application
  get '/' do
    @posts = JSON($redis['posts'])
    @videos = JSON($redis['videos'])
    erb :home
  end
end
