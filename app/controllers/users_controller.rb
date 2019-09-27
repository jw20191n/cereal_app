class UsersController < ApplicationController

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
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :img_url)
    end

end
