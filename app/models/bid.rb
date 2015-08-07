class Bid < ActiveRecord::Base

  belongs_to :item
  belongs_to :user

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

end