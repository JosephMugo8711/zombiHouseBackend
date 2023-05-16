require 'base64'

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
      @buyer = Buyer.create(buyer_params)
      if @buyer.valid?
        @token = encode_token(buyer_id: @buyer.id)
        render json: { buyer: BuyerSerializer.new(@buyer), jwt: @token }, status: :created
      else
        render json: { error: 'Failed to create buyer' }, status: :unprocessable_entity
      end
    end
  
    def login
        @buyer = Buyer.find_by(username: buyer_login_params[:username])
        puts "Username: #{buyer_login_params[:username]}"
        puts "Password: #{buyer_login_params[:password]}"
      
        if @buyer && @buyer.authenticate(buyer_login_params[:password])
          token = encode_token({ buyer_id: @buyer.id })
          render json: { buyer: BuyerSerializer.new(@buyer), jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end
      
  
    def update
      buyer = find_buyer
      buyer.update!(buyer_params)
      render json: buyer, status: :created
    end
  
    def destroy
      buyer = find_buyer
      buyer.destroy
      head :no_content
    end
  
    private
  
    def find_buyer
      Buyer.find(params[:id])
    end 
  
    def buyer_not_found
      render json: { error: "Buyer not found" }, status: :not_found
    end
  
    def unprocessable_entity(invalid)
      render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
  
    def handle_errors
      unpermitted_params = params.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :budget, :subscription_package, :password).keys
      render json: { "Unpermitted Parameters": unpermitted_params }, status: :unprocessable_entity
    end
  
    def buyer_params
      params.require(:buyer).permit(:username, :fullname, :email, :contact, :avatar, :budget, :subscription_package, :password)
    end
  
    def buyer_login_params
      params.require(:buyer).permit(:username, :password)
    end
  end
  