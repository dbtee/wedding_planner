class User < ApplicationRecord
    
    has_secure_password
    has_one :seat
    validates :full_name, presence: true
    validates :password_digest, presence: true

end
