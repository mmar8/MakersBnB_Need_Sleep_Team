require "sinatra/base"
require './lib/booking.rb'
class BookingController < Sinatra::Base
  configure do
    set :views, 'views/'
    set :root, File.expand_path('../../../', __FILE__)
  end
  post "/space/:id/booking" do
    Booking.create(space_id: params['id'], guest_id: session[:userid], request_text: params[:request_description])
    redirect "/booking/pending"
  end

  get '/booking/pending' do
    erb :booking_pending
  end
end
