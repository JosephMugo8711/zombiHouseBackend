class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
    def create
      @user = User.find_by(username: user_login_params[:username])
  
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:username, :password)
    end
  end
  



# class UsersController < ApplicationController
#     skip_before_action :authorized, only: [:create]
#     rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
#     rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
#     rescue_from ActionController::UnpermittedParameters, with: :handle_errors
  
#     def create
#       @user = User.find_by(username: user_login_params[:username])
  
#       if @user && @user.authenticate(user_login_params[:password])
#         token = encode_token({ user_id: @user.id })
#         render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
#       else
#         render json: { message: 'Invalid username or password' }, status: :unauthorized
#       end
#     end
  
#     private
  
#     def user_login_params
#       params.permit(:username, :password)
#     end

    
#     def user_not_found
#         render json: { error: "user not found" }, status: :not_found
#       end
    
#       def unprocessable_entity(invalid)
#         render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
#       end
    
#       def handle_errors
#         unpermitted_params = params.except(:controller, :action, :id, :username, :fullname, :email, :contact, :avatar, :budget, :subscription_package, :password).keys
#         render json: { "Unpermitted Parameters": unpermitted_params }, status: :unprocessable_entity
#       end
#   end
  
