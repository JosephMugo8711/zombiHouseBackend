class Seller < ApplicationRecord
    validates :company_name, uniquiness: true, presence: true
    validates :location, presence: true
    validates :email, presence: true, uniqueness: true
    validates :contact, presence: true
    validates :password, presence: true, length: {minimum: 8}

    has_many :properties
    has_many :buyers, through: :properties
    has_secure_password
end
