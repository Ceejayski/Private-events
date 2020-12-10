module ApplicationHelper
  def navlinks
    links = []
    if logged_in?
      links[0] = link_to current_user.name.to_s, user_path(current_user), class: 'nav-link'
      links[1] = link_to 'Create Event', new_event_path(@event), class: 'nav-link'
      links[2] = link_to 'Logout', logout_path(@user), class: 'nav-link', method: :delete
    else
      links[0] = link_to 'Sign up', new_user_path(@user), class: 'nav-link'
    end
    links
  end
end
