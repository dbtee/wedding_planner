class AddDefaultValueToRsvp < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :rsvp, 'integer USING CAST(rsvp AS integer)'
  end
end
