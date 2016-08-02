class Api::V1::MailboxController < ApplicationController

  before_action :authenticate, except: :create
  respond_to :json
  
  def create
    session = get_session
    mc = MailboxCollection.find_by(user_id: session[:id])
    m = Mailbox.new(mailbox_collection: mc)
    
    if m.save!
      render json: m
    else
      render status: 500
    end
  end

end
