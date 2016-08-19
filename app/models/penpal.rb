class Penpal < ApplicationRecord
  belongs_to :user_1, :class_name => :User, :foreign_key => "user_1_id"
  belongs_to :user_2, :class_name => :User, :foreign_key => "user_2_id"

  after_create  :create_flipped_record

  def create_flipped_record
    unless Penpal.find_by(user_1: self.user_2, user_2: self.user_1)
      p = Penpal.create(user_1: self.user_2, user_2: self.user_1)
    end
  end

end
