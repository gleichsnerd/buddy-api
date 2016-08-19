class CreatePenpals < ActiveRecord::Migration[5.0]
  def change
    create_table :penpals do |t|
      t.references :user_1, references: :user
      t.references :user_2, references: :user

      t.timestamps
    end
  end
end
