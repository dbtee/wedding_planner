class Seat < ApplicationRecord
    belongs_to :table
    belongs_to :user, optional: :true
    validates :number, presence: true
    default_scope { order(created_at: :asc)}

end
