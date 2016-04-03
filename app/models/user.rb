class User < ActiveRecord::Base
  has_many :manoises
  has_secure_password
  validates :username, :image_url, presence: true, uniqueness: true

  acts_as_followable
  acts_as_follower
end
