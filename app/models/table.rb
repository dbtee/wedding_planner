class Table < ApplicationRecord
    has_many :seats, dependent: :destroy
    validates :number, presence: true
    
end
