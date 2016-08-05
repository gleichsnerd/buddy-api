class MailboxSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :mailbox_collection
end
