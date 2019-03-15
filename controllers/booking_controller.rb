require "sinatra/base"
require './lib/booking.rb'
require './lib/space.rb'

class BookingController < Sinatra::Base
  set :method_override, true

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
    @bookings = Space.joins(:bookings)
                     .select("bookings.*")
                     .where(owner_id: session[:userid])
    erb :bookings
  end

  post "/space/:id/booking" do
    Booking.create(
      space_id: params['id'],
      guest_id: session[:userid],
      status: 'pending',
      request_text: params[:request_description]
    )
    redirect "/booking/pending"
  end

  patch "/booking/:id" do
    booking = Booking.find(params[:id])
    booking.update(status: params[:status])
    redirect "/bookings"
  end

  get '/booking/pending' do
    erb :booking_pending
  end

  get "/requested_bookings" do
    @my_bookings = Booking.where(guest_id: session[:userid])
    erb :requested_bookings
  end
end
