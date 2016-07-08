class LetterSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :subject, :content, :mailbox_id
  has_one :mailbox
end