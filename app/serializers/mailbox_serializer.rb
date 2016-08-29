class MailboxSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :mailbox_collection
end
