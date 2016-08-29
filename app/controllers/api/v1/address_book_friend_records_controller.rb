class Api::V1::AddressBookFriendRecordsController < ApplicationController

  before_action :authenticate

  def show
    ab = AddressBook.find_by(user: User.find(@@session[:id]))
    abfr = AddressBookFriendRecord.find(params[:id])

    abf = abfr.address_book_friend

    if ab == abf.address_book
      render json: abfr
    else
      render status: 404
    end
  end

  def index

    user = User.find(@@session[:id])
    address_book = AddressBook.find_by(user: user)

    render json: AddressBookFriendRecord.joins(:address_book_friend).where("address_book_friends.address_book_id = ?", address_book.id)
  end
end
