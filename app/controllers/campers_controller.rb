class CampersController < ApplicationController
    def index
        render json: Camper.all, except: :activities, status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, serializer: FindcamperSerializer, status: :ok
        else
            render json: {error: 'Camper not found'}, status: :not_found
        end
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    private

    def camper_params
        params.permit(:name, :age)
    end
end
