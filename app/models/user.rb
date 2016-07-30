class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!
  after_create  :create_mailbox_collection

  has_one :mailbox_collection
  has_many :mailboxes, through: :mailbox_collection

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def create_mailbox_collection
    if self.mailbox_collection_id.nil?
      mc = MailboxCollection.create()
      mc.user_id = self.id
      mc.save

      self.mailbox_collection_id = mc.id
      self.save  
    end
  end
end
