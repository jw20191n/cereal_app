class SessionsController < ApplicationController
    skip_before_action :authenticate, only: [:new, :create, :destroy]

    def new
        render :new
    end

    def create
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "invalid username or password"
            redirect_to new_session_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end
end
