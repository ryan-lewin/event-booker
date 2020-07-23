class EventUsersController < ApplicationController

	def index
		@events = Event.where(:user_id => current_user.id)
		@event_ids = Event.where(:user_id => current_user.id).pluck(:id)
		@pending = EventUser.where(approved: false, event_id: @event_ids)
		@approved = EventUser.where(approved: true, event_id: @event_ids)
	end

	def create
		puts params[:event]
		@event = Event.find(params[:event])
		@user = User.find(session[:user_id])
		@event_user = EventUser.new
		@event_user.event = @event
		@event_user.user = @user
		@event_user.event_title = @event.title
		@event_user.user_name = @user.f_name + " " + @user.l_name
		@event_user.save
    redirect_to root_path
	end

	def update
		puts 'start'
		puts params
		puts 'puts'
		@event_user = EventUser.find(params[:id])
		@event_user.update(approved: true)
		flash.notice = "Event has been updated"
		redirect_to event_user_path(@event_user)
	end

end


# @event = Event.find(params[:id])
# @event.update(event_params)
# flash.notice = "Event has been updated"
# redirect_to event_path(@event)