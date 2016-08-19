class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!
  after_create  :create_mailbox_collection, :create_address_book

  has_one :mailbox_collection
  has_many :mailboxes, through: :mailbox_collection

  has_many :sent_from_user
  has_many :sent_to_user

  has_many :penpals, foreign_key: "user_1_id"
  has_many :buddies, through: :penpals, source: :user_2, class_name: "User"

  has_one :address_book

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def create_mailbox_collection
    if self.mailbox_collection.nil?
      mc = MailboxCollection.create(user: self)
      mc.save

      self.mailbox_collection = mc
      self.save
    end
  end

  def create_address_book
    if self.address_book.nil?
      ab = AddressBook.create(user: self)
      ab.save

      self.address_book = ab
      self.save
    end
  end
end
