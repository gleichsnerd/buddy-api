class MailboxCollection < ApplicationRecord
  belongs_to :user
  has_many :mailboxes
end
