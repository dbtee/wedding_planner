class AddNumbersColumnsAgain < ActiveRecord::Migration[6.0]
  def change
    add_column :tables, :number, :integer
    add_column :seats, :number, :integer

  end
end
