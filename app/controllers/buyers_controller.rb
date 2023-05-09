class BuyersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :buyer_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActionController::UnpermittedParameters, with: :handle_errors

    def index 
        render json: Buyer.all, status: :ok
    end

    def show
        buyer = find_buyer
        render json: buyer, status: :ok
    end

    def create
        buyer = Buyer.create!(buyer_params)
        render json: buyer, status: :created
    end

    def update
        buyer = find_buyer
        buyer.update!(buyer_params)
        render json: buyer, status: :created
    end

    def destroy
        buyer = find_buyer
        buyer.destroy
        head: no_content
    end

    private

    def find_buyer
        Buyer.find(params[:id])
    end 

    def buyer_not_found
        render json: { error: "buyer not found" }, status: :not_found
    end

    def buyer_params
        params.require(:buyer).permit(:username, :fullname, :email, :contact, :avatar, :password)
    end

    def unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.fullmessages }, status: :unprocessable_entity
    end

    def handle_errors
        render json: { "Unpermitted Parameters".params.to_unsafe_h.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :password).keys}, status: :unprocessable_entity
    end

end
