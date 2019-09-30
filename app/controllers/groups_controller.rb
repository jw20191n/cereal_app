class GroupsController < ApplicationController
    before_action :find_group, only: [:show, :edit, :update]

    def index
        @groups = Group.all
        render :index
    end

    def new
        @group = Group.new
        render :new
    end

    def create
        @group = Group.create(group_params)
        redirect_to group_path(@group)
    end

    def show
        render :show
    end

    def edit
        render :edit
    end

    def update
        @group.update(group_params)
        redirect_to group_path(@group)
    end

    def join
        @user = User.find(session[:user_id])
        @user.group_id = params[:group_id]
        @user.save
        redirect_to groups_path
    end

    private
    def find_group
        @group = Group.find(params[:id])
    end

    def group_params
        params.require(:group).permit(:name, :location)
    end
end
