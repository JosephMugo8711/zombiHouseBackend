class Seller < ApplicationRecord
    validates :company_name, uniqueness: true, presence: true
    validates :location, presence: true
    validates :email, presence: true, uniqueness: true
    validates :contact, presence: true
    validates :password_digest, presence: true, length: { minimum: 8 }

    has_many :properties
    has_many :buyers, through: :properties
    has_secure_password
end
