class AddressBookFriendRecordSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :mailbox
  belongs_to :address_book_friend
end
