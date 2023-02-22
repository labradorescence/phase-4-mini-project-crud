class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices

        # render json: Spice.all
    end

    def show
        # byebug
        spice = Spice.find(params[:id])
        render json: spice
    end

    def create
        spice = Spice.create!(spice_params)
        render json: spice
    end

    def update 

        spice = Spice.find(params[:id])
        spice.update(spice_params)

        render json: spice
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        
        render json: spice, status: :ok
        #head :no_content
    end


    private 

        def spice_params
            params.permit(:title, :image, :description, :notes, :rating)
        end
end
