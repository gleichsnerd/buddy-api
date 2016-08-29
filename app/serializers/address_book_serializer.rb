class AddressBookSerializer < ActiveModel::Serializer
  attributes :id
  has_many :address_book_friends
end
