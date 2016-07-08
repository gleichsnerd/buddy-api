class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t| 
      t.references :sent_from, index:true
      t.references :sent_to, index:true
      t.string :subject
      t.string :content
      t.references :mailbox, index: true

      t.timestamps
    end
  end
end
