class User < ApplicationRecord
    
    has_secure_password

    # validates :email, uniqueness: true,format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :first_name, presence: true
    validates :last_name, presence: true
    # validates :phone, length: { minimum: 10 }
    validates :password_digest, presence: true

    def full_name
        "#{first_name} #{last_name}".strip
    end

end
