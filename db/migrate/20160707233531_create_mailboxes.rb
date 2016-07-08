class CreateMailboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :mailboxes do |t|
      t.string :user

      t.timestamps
    end
  end
end
