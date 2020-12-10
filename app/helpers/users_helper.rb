module UsersHelper
  def user_params
    params.require(:user).permit(:name)
  end

  def events_empty
    events = []
    if @user.events.empty?
      events << 'User is not hosting'
    else
      @user.events.each do |event|
        events << (link_to event.description, event_path(event))
      end
    end
    events
  end

  def planned_event
    events = []
    if @user.attended_events.upcoming.count.zero?
      events << 'No planned Events'
    else
      @user.attended_events.upcoming.each do |event|
        events << (link_to event.description, event_path(event))
      end
    end
    events
  end

  def old_event
    events = []
    if @user.attended_events.past.count.zero?
      events << 'No Events Attended'
    else
      @user.attended_events.past.each do |event|
        events << (link_to event.description, event_path(event))
      end
    end
    events
  end
end
