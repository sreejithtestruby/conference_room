class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		@rooms = Room.all
    @rooms_arr = []
    if @rooms.present?
      @rooms.each do |r|
        @rooms_arr << [r.title, r.id]
      end
    end
	end

	def show_calendar
		@event = Event.where(room_id: params["room_id"])
		events_arr = []
		@event.each do |a| 
			s = Hash.new
			s["title"] = a.event_name
			#start: '2016-09-29'
			s["start"] = a.start_date.to_date.strftime("%Y-%m-%d")
			events_arr << s
		end
		@events_arr = events_arr.to_json
	end
	
end
