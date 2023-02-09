class SignupsController < ApplicationController
    def create
        signup = Signup.create!(signup_params)
        render json: Activity.find(params[:activity_id]), status: 201
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
