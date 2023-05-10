class Transaction < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  belongs_to :admin
  belongs_to :subscription_package
end
