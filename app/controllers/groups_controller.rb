class GroupsController < ApplicationController
    before_action :find_group, only: [:show, :edit, :update]

    def index
        @groups = Group.all
        render :index
    end

    def leave
        @user = User.find(session[:user_id])
        @user.group_id = nil
        @user.save
        redirect_to user_path(@user)
    end

    def new
        @group = Group.new
        render :new
    end

    def create
        @group = Group.new(group_params)
        if @group.save  
            redirect_to group_path(@group)
        else
            flash[:errors] = @group.errors.full_messages
            redirect_to new_group_path
        end
    end

    def show
        render :show
    end

    def edit
        render :edit
    end

    def update
        if @group.update(group_params)
            redirect_to group_path(@group)
        else
            flash[:errors] = @group.errors.full_messages
            redirect_to edit_group_path
        end
    end

    def join
        @user = User.find(session[:user_id])
        @user.group_id = params[:group_id]
        @user.save
        redirect_to user_path(@user)
    end



    private
    def find_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:name, :location, :img_url)
    end
end
