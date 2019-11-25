class ChangeRsvpDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :rsvp, 0
  end
end
