class AddressBookFriendRecord < ApplicationRecord
  belongs_to :address_book_friend
  belongs_to :mailbox
end
