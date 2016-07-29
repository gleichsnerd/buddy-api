include ActionController::HttpAuthentication::Token::ControllerMethods

class ApplicationController < ActionController::API

  def authenticate
    session = nil

    no_session = {code: 400, success: false, reason: "No session passed"}
    bad_auth = {code: 403, success: false, reason: "Invalid auth params"}

    if request.method.eql? "GET"
      session = request.headers[:session]
    else
      session = params[:session]
    end

    #TODO: Sanitize session
    if session.nil?
      return render status: 400, json: no_session.as_json
    elsif session.is_a? String
      session = eval(session)
    end

    id = session[:id]
    token = session[:token]
    user = nil

    if !id.nil? && !token.nil?
      user = User.find(id)

      if !user.nil? && user.auth_token.eql?(token)
        return
      end
    end

    return render status: 403, json: bad_auth.as_json
  end

end