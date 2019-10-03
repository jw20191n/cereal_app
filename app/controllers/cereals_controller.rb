class CerealsController < ApplicationController
    before_action :find_cereal, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate, only: [:index, :show]
    def index
        @cereals = Cereal.all
        
    end

    def show
        @comment = Comment.new
        @comments = Comment.where(cereal_id: @cereal.id)
        @transactions = @cereal.transactions
        @transaction = Transaction.new
        @user = User.find(session[:user_id])
        render :show
    end

    def new
        @cereal = Cereal.new
        render :new
    end

    def create
        @cereal = Cereal.new(cereal_params)
        if !@cereal.save
            flash[:errors] = @cereal.errors.full_messages
            redirect_to new_cereal_path
        else
        cereal_name = params[:cereal][:name].split.join("+") + "+cereal+box"
        @cereal.img_url = @cereal.find_image(cereal_name)
        @cereal.user_id = session[:user_id]
        @cereal.save
        @cereal.user.update_total(params[:cereal][:amount])
        redirect_to cereal_path(@cereal)
        end
    end

    def edit
        render :edit
    end

    def update      
        if (params[:cereal][:img_url] == @cereal.img_url)
            cereal_name = params[:cereal][:name].split.join("+") + "+cereal"
            @cereal.img_url = @cereal.find_image(cereal_name)
            @cereal.update(param_without_img_url)
        else
            @cereal.update(cereal_params)
        end
        redirect_to cereal_path(@cereal)
    end

    def destroy
        @cereal.destroy
        redirect_to cereals_path
    end

    def list
        @cereal = Cereal.where(name: params[:name])
        @cereals = @cereal.sort_by{ |cereal| cereal.amount}.reverse
        render :list
    end

    private
    def find_cereal
        @cereal = Cereal.find(params[:id])
    end

    def cereal_params
        params.require(:cereal).permit(:name, :amount, :img_url)
    end

    def param_without_img_url
        params.require(:cereal).permit(:name, :amount)
    end


end
