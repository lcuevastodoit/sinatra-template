# app.rb
class App < Sinatra::Base
  puts 'App loaded'
  get '/' do
    'Hello world!'
  end
end
