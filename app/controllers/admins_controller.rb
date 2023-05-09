class AdminsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :admin_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActionController::UnpermittedParameters, with: :handle_errors

    def index 
        render json: Admin.all, status: :ok
    end

    def show
        admin = find_admin
        render json: admin, status: :ok
    end

    def create
        admin = Admin.create!(admin_params)
        render json: admin, status: :created
    end

    def update
        admin = find_admin
        admin.update!(admin_params)
        render json: admin, status: :created
    end

    def destroy
        admin = find_admin
        Admin.destroy
        head: no_content
    end

    private

    def find_admin
        Admin.find(params[:id])
    end 

    def admin_not_found
        render json: { error: "Admin not found" }, status: :not_found
    end

    def admin_params
        params.require(:admin).permit(:username, :fullname, :email, :contact, :avatar, :password)
    end

    def unprocessable_entity(invalid)
        render json: { error: invalid.record.errors.fullmessages }, status: :unprocessable_entity
    end

    def handle_errors
        render json: { "Unpermitted Parameters".params.to_unsafe_h.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :password).keys}, status: :unprocessable_entity
    end
end
