class EventsController < ApplicationController
  include EventsHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @owners = Owner.all
  end

  def create
    @event = Event.new(event_params)
    @event.owner_id = session[:user_id]
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
