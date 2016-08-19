class CreateAddressBookFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :address_book_friends do |t|
      t.references :address_book, foreign_key: true
      t.references :friend, references: :user

      t.timestamps
    end
  end
end
