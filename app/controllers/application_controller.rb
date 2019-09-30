class ApplicationController < ActionController::Base

    before_action :authenticate
    helper_method :logged_in?, :nothing?


    def current_user
        @user = User.find_by(id:session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authenticate
        if logged_in?
            current_user
        else
            flash[:error] = "You must be logged in to see that"
            redirect_to new_session_path
        end
    end

    
end
