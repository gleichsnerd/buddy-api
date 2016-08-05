class MailboxCollectionSerializer < ActiveModel::Serializer
  attributes :id
  has_many :mailboxes
end
