class User < ApplicationRecord
    
    has_secure_password
    has_one :seat

    # scope :is_admin, -> {where is_admin: true}
    # scope :nationality, -> (nationality) {where("nationality LIKE ?", nationality)}
    # scope :allergies, -> {where ("allergies = 'None'"), false }
    # scope :table_num, -> (table_num) {where('table_num LIKE ?', table_num)}


    

    # validates :email, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :full_name, presence: true
    # validates :phone, length: { minimum: 10 }
    validates :password_digest, presence: true



end
