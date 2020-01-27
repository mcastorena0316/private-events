module SessionsHelper
    def full_title         
        base_title = "Welcome to Private events"  
        if logged_in?                    
          @user.name              
        else
         base_title                 
        end
      end

      def current_user
        if session[:user_id]
          current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end
end
