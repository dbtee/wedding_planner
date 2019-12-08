class AddReferencesToSeat < ActiveRecord::Migration[6.0]
  def change
    add_reference :seats, :user, null: true, foreign_key: true
    add_reference :seats, :table, null: true, foreign_key: true
  end
end
