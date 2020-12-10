class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :events_attendance, :events_created, :attend, :user_find_invited,
                :user_find_accepted
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorization
    redirect_to login_path, alert: 'Sign up or Log in to see the events!' unless current_user
  end

  def events_attendance
    current_user.attended_events
  end

  def events_created
    current_user.events
  end

  def attend(user)
    Attendance.find_by(event_id: params[:event_id], user_id: user.id)
  end

  def user_find_invited
    User.find(@event.attendances.invited.map(&:user_id))
  end

  def user_find_accepted
    User.find(@event.attendances.accepted.map(&:user_id))
  end
end
