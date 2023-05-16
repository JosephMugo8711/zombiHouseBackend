
class PropertiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :property_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActionController::UnpermittedParameters, with: :handle_errors

    def index 
        render json: Property.all, status: :ok
    end

    def show
        property = find_property
        render json: property, status: :ok
    end

    def create
        property = Property.create!(property_params)
        render json: property, status: :created
    end

    def update
        property = find_property
        property.update!(property_params)
        render json: property, status: :created
    end

    def destroy
        property = find_property
        property.destroy
        head: no_content
    end

    private

    def find_property
        Property.find(params[:id])
    end 

    def property_not_found
        render json: { error: "property not found" }, status: :not_found
    end

    def property_params
        params.require(:property).permit(:username, :fullname, :email, :contact, :avatar, :password)
    end

    def unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.fullmessages }, status: :unprocessable_entity
    end

    def handle_errors
        render json: { "Unpermitted Parameters".params.to_unsafe_h.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :password).keys}, status: :unprocessable_entity
    end
end