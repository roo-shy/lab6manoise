class Manoise < ActiveRecord::Base
    validates :post, presence: true, length: {maximum: 255}
    belongs_to :user
    paginates_per 20

  end
