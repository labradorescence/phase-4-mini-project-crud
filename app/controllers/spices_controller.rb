class SpicesController < ApplicationController

        def index
            spices = Spice.all
            
            render json: spices
        end

        def show 
            spice = Spice.find(params[:id])

            render json: spice, status: :ok
        end

        def create
            spice = Spice.create!(spice_params)

            render json: spice, status: :created
        end

        def update
         #   byebug
            spice = Spice.find(params[:id])
            spice.update(spice_params)

            render json: spice, status: :ok
        end

        def destroy
            spice = Spice.find_by(id: params[:id])
            spice.destroy

            render json: spice, status: :ok
            #head :no_content
        end

        private #private method - internal use # only available for other instance methods in this same class

            #strong params: prevents unpermitted requests
        def spice_params
            params.permit(:title, :image, :description, :notes, :rating)
        end

end
