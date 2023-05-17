class User < ApplicationRecord
    ROLES = %w[seller buyer admin].freeze

    has_many :purchases, class_name: 'Transaction', foreign_key: 'buyer_id'
    has_many :sales, class_name: 'Transaction', foreign_key: 'seller_id'

    validates :role, presence: true, inclusion: { in: ROLES }
    validates :budget, presence: true, if: :buyer?

    validates :company_name, presence: true, if: :seller_and_company?
    validates :location, presence: true, if: :seller_and_company?
    validates :username, presence: true, if: :seller_and_individual?
    validates :fullname, presence: true, if: :seller_and_individual?



    def admin?
        role == 'admin'
    end
    
    def buyer?
        role == 'buyer'
    end
    
    def seller?
        role == 'seller'
    end

    
  def seller_and_company?
    seller? && company?
  end

  def seller_and_individual?
    seller? && individual?
  end

  private

  def company?
    company_name.present? && location.present?
  end

  def individual?
    username.present? && fullname.present?
  end
end
