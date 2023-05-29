class Group < ApplicationRecord
  has_many :payments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :author_id, presence: true
  validates :icon, presence: true

  def total_amount
    payments.where(author_id:).sum(:amount)
  end
end
