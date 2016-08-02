class Letter < ApplicationRecord
  belongs_to :sent_from_user
  belongs_to :sent_to_user
end
