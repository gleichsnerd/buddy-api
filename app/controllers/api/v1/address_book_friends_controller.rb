class Api::V1::AddressBookFriendsController < ApplicationController

  before_action :authenticate

  def show
    user = User.find_by(id: @@session[:id])
    render json: AddressBookFriend.find_by(id: params[:id], address_book: user.address_book)
  end

  def index
    render json: User.find_by(id: @@session[:id]).address_book_friends
  end

end
