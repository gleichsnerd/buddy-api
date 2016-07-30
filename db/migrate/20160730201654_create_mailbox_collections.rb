class CreateMailboxCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :mailbox_collections do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
