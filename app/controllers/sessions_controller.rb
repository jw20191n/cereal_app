class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find(params[:user][:id])
        @user = User.authenticate
    
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
