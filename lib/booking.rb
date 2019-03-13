require 'active_record'
class Booking < ActiveRecord::Base
  belongs_to :space
end
