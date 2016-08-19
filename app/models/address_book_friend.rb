class AddressBookFriend < ApplicationRecord
  belongs_to :address_book
  belongs_to :friend, class_name: "User", foreign_key: "friend_id"
  has_many :address_book_friend_records
end
