class User < ApplicationRecord
    
    has_secure_password

    # validates :email, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :full_name, presence: true
    # validates :phone, length: { minimum: 10 }
    validates :password_digest, presence: true



end
