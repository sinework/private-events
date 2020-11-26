module ApplicationHelper
    def user_status
        links = []
        if logged_in?
          links[0] = link_to 'New Event', new_event_path, class: 'nav-link'
          links[1] = link_to "Log out", logout_path, method: "delete" , class: 'nav-link'
          links[2] = link_to "#{current_user.username}", user_path(current_user.id),  class: 'nav-link'
        else
          links[0] = link_to "Login", 'login', class: 'nav-link'
          links[1] = link_to 'Sign Up', 'signup', class: 'nav-link'
        end
        links
    end
    def usernames 
    current_user.username.to_s
    end
    def users_ids
    current_user.id
    end
    def date_format(event, new_date = nil)
        if event.nil?
          new_date.to_formatted_s(:long) if !new_date == nil?
        else
          event.date&.to_formatted_s(:long)
        end
      end
    
      def events_attended
        current_user.attended_events
      end
    
      def all_events_created_by_user
        current_user.events
      end
 
    def attendance_status(event)
      results=[]
      if logged_in?
        if events_attended.find_by(id:event.id)
          results << "<button class='btn btn-success text-decoration-none text-light'> Attending </button> "
          results << "<button class='btn btn-danger text-decoration-none'>#{link_to "Cancel", attendance_path(event.id), method: :delete, class:'text-decoration-none text-light'} </button> "
        else
          results << "<button class='btn btn-primary'> #{link_to 'Attend', attendances_path(controller: 'attendances', action: 'create', event_id: event.id), method: :post, class:'text-decoration-none text-light' } </button> "
          
        end
      else 
        results <<  "<button class='btn btn-primary text-decoration-none text-light'>Login to attend </button> "
      end
      results
  end
end

