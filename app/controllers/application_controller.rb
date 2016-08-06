include ActionController::HttpAuthentication::Token::ControllerMethods

class ApplicationController < ActionController::API

  def authenticate
    session = get_session

    no_session = {
      success: false,
      message: "Error: no session was passed in"
    }

    #TODO: Sanitize session
    if session.nil?
      puts "***Error: no session passed in"
      return render status: 400, json: no_session
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

  def get_session
    session = nil

    if request.method.eql? "GET"
      session = request.headers[:session]
    else
      session = params[:session]
    end

    if !session.nil? && session.is_a?(String) then
      session = eval(session)
    end

    return session
  end

end