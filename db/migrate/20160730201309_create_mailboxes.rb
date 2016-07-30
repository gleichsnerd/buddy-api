class CreateMailboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :mailboxes do |t|
      t.string :name
      t.references :mailbox_collection, index: true
      t.references :location

      t.timestamps
    end
  end
end
