module ApplicationHelper
    def full_title         
        base_title = "Welcome to Private events"  
        if logged_in?                             
          @user.name                                  
        else
         base_title                 
        end
      end
end
