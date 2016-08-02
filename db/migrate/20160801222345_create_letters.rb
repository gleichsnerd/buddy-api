class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.string :subject
      t.string :content
      t.references :sent_from_user
      t.references :sent_to_user
      
      t.timestamps
    end
  end
end
