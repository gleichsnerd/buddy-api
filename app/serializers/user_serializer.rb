class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :mailboxes, through: :mailbox_collection
  has_many :address_book_friends, through: :address_book
end
