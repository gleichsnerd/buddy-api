class CreateSentFromUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :sent_from_users do |t|
      t.references :user
      t.references :letter

      t.timestamps
    end
  end
end
