class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
  validates :group_id, presence: true
end
