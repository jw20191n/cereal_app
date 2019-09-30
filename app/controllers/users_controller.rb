class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:home, :new, :create]
    before_action :find_user, only: [:show, :edit, :update]

    def home
        render :home
    end

    def show
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def edit
        render :edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end



    private

    def find_user
        # if session[:user]
        @user = User.find(session[:user_id])
        # else

            # flash[:error] = "you need to login"
            # redirect_to new_session_path
        # end
    end
    
    def user_params
        params.require(:user).permit(:name, :username, :password, :img_url)
    end

end
