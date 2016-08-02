class Api::V1::LetterController < ApplicationController
  
  before_action :authenticate
  respond_to :json

  def create
    session = get_session
    subject = params[:subject]
    content = params[:content]
    to_user = User.find(params[:to_user_id])
    from_user = User.find(session[:id])

    sf = SentFromUser.create(user: from_user)
    st = SentToUser.create(user: to_user)

    render json: Letter.create(subject: subject, content: content, sent_from_user:sf, sent_to_user:st)
  end

end
