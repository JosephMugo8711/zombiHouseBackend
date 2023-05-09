class SellersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :seller_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActionController::UnpermittedParameters, with: :handle_errors

    def index 
        render json: Seller.all, status: :ok
    end

    def show
        seller = find_seller
        render json: seller, status: :ok
    end

    def create
        seller = Seller.create!(seller_params)
        render json: seller, status: :created
    end

    def update
        seller = find_seller
        seller.update!(seller_params)
        render json: seller, status: :created
    end

    def destroy
        seller = find_seller
        seller.destroy
        head: no_content
    end

    private

    def find_seller
        Seller.find(params[:id])
    end 

    def seller_not_found
        render json: { error: "seller not found" }, status: :not_found
    end

    def seller_params
        params.require(:seller).permit(:username, :fullname, :email, :contact, :avatar, :password)
    end

    def unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.fullmessages }, status: :unprocessable_entity
    end

    def handle_errors
        render json: { "Unpermitted Parameters".params.to_unsafe_h.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :password).keys}, status: :unprocessable_entity
    end

end
