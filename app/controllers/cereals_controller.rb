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
        redirect_to cereal_path(@cereal)
    end

    def edit
        render :edit
    
    end

    def update
        @cereal.update(cereal_params)
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
        params.require(:cereal).permit(:name, :user_id, :amount)
    end
end
