class AddressBook < ApplicationRecord
  belongs_to :user
  has_many :address_book_friends
end
