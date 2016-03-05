require 'pry'
require './environment'
require_relative "./app/models/pirate"
require_relative "./app/models/ship"


module FormsLab
  class App < Sinatra::Base

    get '/' do 
      "Welcome to the Nested Forms Lab! let's navigate to the '/new' "
    end

    get '/new' do 
      erb :"pirates/new"
    end

    post '/show' do 
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |ship, details|
        Ship.new(details)
      end

      @ships = Ship.all

      erb :"pirates/show"
    end
  end
end
