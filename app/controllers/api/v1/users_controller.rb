class Api::V1::UsersController < ApplicationController

  before_action :authenticate, except: :create
  respond_to :json

  def create
    signup_params = create_signup_params
    user = User.create!(signup_params)
    
    if user.save
      reply = {
        session: {
          id: user.id,
          token: user.auth_token
        }
      }
      render json: reply.as_json, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def show
    if @@session[:id] != params[:id].to_i
      render json: User.find(params[:id].to_i), serializer: FriendSerializer
    else
      render json: User.find(@@session[:id]), each_serializer: UserSerializer
    end
  end

  protected

  def create_signup_params
    signup = {}
    signup[:email] = params[:email]
    signup[:password] = params[:password]
    signup[:password_confirmation] = params[:password_confirmation]

    if params[:first_name]
      signup[:first_name] = params[:first_name]
    end

    if params[:last_name]
      signup[:last_name] = params[:last_name]
    end

    signup
  end

end