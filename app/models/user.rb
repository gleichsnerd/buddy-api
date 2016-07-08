class User < ApplicationRecord
  has_many :mailboxes
  has_many :letters, through :mailboxes
end
