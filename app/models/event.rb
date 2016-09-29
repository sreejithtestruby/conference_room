class Event < ActiveRecord::Base
	validates_presence_of :event_name, :message => :cant_be_blank
  validates_presence_of :room_id
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :room, :class_name => "Room", :foreign_key => "room_id"
  validate :validate_uniqeness, :on => :create
  validate :validate_uniqeness_on_update, :on => :update
  validates_uniqueness_of :event_name

  def validate_uniqeness
  	event_count = Event.where(:start_date => self.start_date, :end_date => self.end_date ).count
  	if event_count > 0 
  		errors.add(:room_id, "An Event Has already been created for this room in the same time. kindly select some other room")
  	end
  end
  def validate_uniqeness_on_update
  	if self.changes.present?
  		changes = self.changes
  		if changes["start_date"].present? || changes["end_date"].present?
  			validate_uniqeness
  		end
  	end
  end
end
