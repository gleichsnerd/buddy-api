class SessionsController < ApplicationController

  respond_to :json

  def create
    p_hash = params[:session]
    if p_hash.is_a? String
      p_hash = eval(p_hash)
    end

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
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end

end
