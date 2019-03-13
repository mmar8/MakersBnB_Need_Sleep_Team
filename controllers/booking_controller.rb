require "sinatra/base"
require './lib/booking.rb'
require './lib/space.rb'

class BookingController < Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end

  before do
    path = request.path_info
    if (path != "/login"  && path != '/signup') && !session[:userid]
      redirect("/login")
    end
  end

  get '/bookings' do

      @bookings = Space.joins(:bookings).select("bookings.*").where(owner_id: session[:userid])

    erb :bookings
  end
end
