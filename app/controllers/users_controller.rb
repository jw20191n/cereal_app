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
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        render :edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:errors]= @user.errors.full_messages
            redirect_to edit_user_path
        end
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
