class Admin < ApplicationRecord
    validates :username, uniquiness: true, presence: true
    validates :fullname, presence: true
    validates :email, presence: true, uniqueness: true
    validates :contact, presence: true
    validates :password, presence: true, length: {minimum: 8}

    has_secure_password
end
