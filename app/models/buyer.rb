class Buyer < ApplicationRecord
    validates :username, uniquiness: true, presence: true
    validates :fullname, presence: true
    validates :email, presence: true, uniqueness: true
    validates :contact, presence: true
    validates :password, presence: true, length: {minimum: 8}

    has_many :properties
    has_many :sellers, through: :properties
    has_secure_password
end
