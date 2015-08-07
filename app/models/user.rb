class User < ActiveRecord::Base
  has_secure_password

  has_many :items
  has_many :bids

  validates :username, uniqueness: true, presence: true
  validates :password, length: {minimum: 6}, presence: true

end
