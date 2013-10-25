class Physicals < Sinatra::Application
  get '/' do
    redirect '/button'
  end

  get '/button' do
    erb :button
  end
end
