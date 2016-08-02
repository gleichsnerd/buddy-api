class SentToUser < ApplicationRecord
  has_one :letter
  belongs_to :user
end
