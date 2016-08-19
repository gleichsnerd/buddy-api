class AddMailboxToLetter < ActiveRecord::Migration[5.0]
  def change
    add_reference :letters, :mailbox, index: true
  end
end
