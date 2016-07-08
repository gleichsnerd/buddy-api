class CreateSentTos < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_tos do |t|
      t.references :user, index:true
      t.references :letter, index:true
      t.timestamps
    end
  end
end
