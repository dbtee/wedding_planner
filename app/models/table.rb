class Table < ApplicationRecord
    has_many :seats, dependent: :destroy
    validates :number, presence: true
    # has_many :users, through: :seats, dependent: :destroy
end
