class SessionsController < ApplicationController

  respond_to :json
  before_action :authenticate, except: :create

  def create
    p_hash = get_session

    user_password = p_hash[:password]
    user_email = p_hash[:email]

    user = user_email.present? && User.find_by(email: user_email)

    if !user.nil? && user.valid_password?(user_password)
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      reply = {
        session: {
          id: user.id,
          token: user.auth_token
        },
      }
      render json: reply.as_json, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    p_hash = params[:session]
    session = eval(p_hash)
    user = User.find_by(id: session[:id])
    user.generate_authentication_token!
    if user.save!
      render json: { success:true, message:"Logged out"}, status: 200
    else
      render json: { success:false, message:"Unable to log out"}, status: 500
    end
  end
  
end
