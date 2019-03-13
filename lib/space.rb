require 'active_record'

class Space < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
end
