class EventsController < ApplicationController
  include EventsHelper
  before_action :authorization
  helper_method :events_user_attending, :test

  def index
    @event = Event.all
    @past_events = Event.past.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      redirect_to event_path(@event), notice: 'Event created successfully'
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
