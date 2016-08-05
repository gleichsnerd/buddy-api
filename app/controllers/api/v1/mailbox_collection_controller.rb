class Api::V1::MailboxCollectionController < ApplicationController
  before_action :authenticate
  respond_to :json

  def index
    session = get_session
    render json: MailboxCollection.find_by(user_id: session[:id])
  end

  def show
    session = get_session
    render json: MailboxCollection.find_by(id: params[:id], user_id: session[:id])
  end

end
