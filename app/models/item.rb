class Item < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :user_id, presence: true

end
