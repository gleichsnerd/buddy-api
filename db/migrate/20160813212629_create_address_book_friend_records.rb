class CreateAddressBookFriendRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :address_book_friend_records do |t|
      t.references :address_book_friend, foreign_key: true
      t.references :mailbox, foreign_key: true

      t.timestamps
    end
  end
end
