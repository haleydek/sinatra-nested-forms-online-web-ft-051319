require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      
      params[:student][:ships].each do |ship_attr_hash|
        Ship.new(ship_attr_hash)
      end
      
      @ships = Ship.all
      binding.pry
      erb :'pirates/show'
    end

  end
end
