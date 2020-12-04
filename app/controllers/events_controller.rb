class EventsController < ApplicationController
  include EventsHelper
  # @event = Event.new
  before_action :authorization
  helper_method :events_user_attending, :test

  def index
    @event = Event.all
  end


  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
       redirect_to user_path(current_user), notice: 'Event created successfully'
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
