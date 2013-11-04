require 'rubygems'
require 'bundler'
Bundler.require

require 'httparty'
require 'json'

desc 'Update all of the things'
task :update => [:'update:blog', :'update:vimeo']

namespace :update do
  desc 'Store latest posts in Redis'
  task :blog do
    redis['posts'] = HTTParty.get('https://roon.io/api/v1/blogs/button/posts?limit=10').body
  end

  desc 'Store my latest post in Redis'
  task :vimeo do
    redis['videos'] = HTTParty.get('http://vimeo.com/api/v2/channel/thebuttonco/videos.json').body
  end
end

def redis
  @redis ||= if ENV['REDISTOGO_URL']
    uri = URI.parse(ENV['REDISTOGO_URL'])
    Redis.new(host: uri.host, port: uri.port, password: uri.password)
  else
    Redis.new
  end
end
