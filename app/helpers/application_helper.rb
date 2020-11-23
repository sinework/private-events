module ApplicationHelper
    def user_status
        links = []
        if logged_in?
          links[0] = link_to 'New Event', new_event_path, class: 'nav-link'
          links[1] = link_to "Log out", logout_path, method: "delete" , class: 'nav-link'
          links[2] = current_user.username
        else
          links[0] = link_to "Login", 'login', class: 'nav-link'
          links[1] = link_to 'Sign Up', 'signup', class: 'nav-link'
        end
        links
    end
    
    #   def signed_in_only!
    #     redirect_to new_user_session_path unless current_user
    #   end
end
