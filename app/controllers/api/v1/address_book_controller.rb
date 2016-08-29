class Api::V1::AddressBookController < ApplicationController
  
  before_action :authenticate

  def show
    render json: AddressBook.find_by(user_id: @@session[:id], id: params[:id])
  end

  def index
    render json: AddressBook.find_by(user_id: @@session[:id])
  end
end
