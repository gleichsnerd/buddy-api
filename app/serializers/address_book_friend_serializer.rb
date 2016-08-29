class AddressBookFriendSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :friend
  belongs_to :address_book
  has_many :address_book_friend_records
end
