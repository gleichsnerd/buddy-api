class Api::V1::MailboxController < ApplicationController

  before_action :authenticate
  respond_to :json
  
  def create
    session = get_session
    mc = MailboxCollection.find_by(user_id: session[:id])
    m = Mailbox.new(mailbox_collection: mc, name: params[:name])
    
    if m.save!
      render json: m
    else
      render status: 500
    end
  end

  def show
    session = get_session
    render json: Mailbox.find(params[:id])
  end

  def index
    session = get_session
    render json: User.find(session[:id]).mailboxes
  end

end
