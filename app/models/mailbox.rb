class Mailbox < ApplicationRecord
  belongs_to :mailbox_collection
  delegate :user, to: :mailbox_collection
  has_many :letters
end
