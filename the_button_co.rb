class TheButtonCo < Sinatra::Application
  get '/' do
    erb :button
  end
end
