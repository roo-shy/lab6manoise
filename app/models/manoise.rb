class Manoise < ActiveRecord::Base
    belongs_to :user
    validates :post, presence: true, length: {maximum: 255}

    paginates_per 20
    max_paginates_per 100

  end
