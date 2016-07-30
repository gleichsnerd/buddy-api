class Mailbox < ApplicationRecord
  belongs_to :mailbox_collection
  delegate :user, to: :mailbox_collection
end
