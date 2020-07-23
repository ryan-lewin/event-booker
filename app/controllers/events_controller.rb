class EventsController < ApplicationController
  include EventsHelper

  def index
    if current_user != nil and current_user.admin
      @my_events = Event.where(:user_id => current_user.id)
    elsif current_user != nil
      @attending_events = EventUser.where(:user_id => current_user.id)
    end
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    if @event.user == current_user
      @is_owner = true
    end
  end

  def new
    @event = Event.new
    @owners = Owner.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
    flash.notice = "Event has been created"
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash.notice = "Event has been deleted"
    redirect_to action: "index"
  end

  def edit
    @event = Event.find(params[:id])
    @owners = Owner.all
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash.notice = "Event has been updated"
    redirect_to event_path(@event)
  end

end
