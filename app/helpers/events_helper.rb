module EventsHelper
  def events_params
    params.require(:event).permit(:name, :date, :location, :description, :user_id)
  end

  def event_invite
    users = []
    if user_find_invited.any?
      user_find_invited.each do |user|
        users << user.name
      end
    end
    users
  end

  def event_accepted
    users = []
    if user_find_accepted.any?
      user_find_accepted.each do |user|
        users << user.name
      end
    end
    users
  end
end
