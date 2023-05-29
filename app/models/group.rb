class Group < ApplicationRecord
  has_one_attached :icon
  has_and_belongs_to_many :payments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :author_id, presence: true
  validates :icon, presence: true

  def total_amount
    payments.where(author_id:).sum(:amount)
  end
end
