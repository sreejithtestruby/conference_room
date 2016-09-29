class Room < ActiveRecord::Base
	validates_presence_of :title, :message => :cant_be_blank
  validates_presence_of :room_id
  has_many :events	
  validates_uniqueness_of :title
end
