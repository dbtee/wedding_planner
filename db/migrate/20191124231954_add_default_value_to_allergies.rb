class AddDefaultValueToAllergies < ActiveRecord::Migration[6.0]
    def change
      change_column_default :users, :allergies, "None"
    end
  end
  