class CerealsController < ApplicationController
    before_action :find_cereal, only: [:show, :edit, :update, :destroy]
    def index
        @cereals = Cereal.all
    end

    def show
        render :show
    end

    def new
        @cereal = Cereal.new
        render :new
    end

    def create
        @cereal = Cereal.create(cereal_params)
        cereal_name = params[:cereal][:name].split.join("+") + "+cereal+box"
        @cereal.img_url = @cereal.find_image(cereal_name)
        @cereal.save
        redirect_to cereal_path(@cereal)
    end

    def edit
        render :edit
    end

    def update
        
        if (params[:cereal][:img_url] == @cereal.img_url)
            cereal_name = params[:cereal][:name].split.join("+") + "+cereal+box"
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

    private
    def find_cereal
        @cereal = Cereal.find(params[:id])
    end

    def cereal_params
        params.require(:cereal).permit(:name, :user_id, :amount, :img_url)
    end

    def param_without_img_url
        params.require(:cereal).permit(:name, :user_id, :amount)
    end


end
