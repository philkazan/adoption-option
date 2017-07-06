class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :votes

  validates :user_id, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_eaqual_to: 1, less_than_or_eaqual_to: 5, :message => "must be a whole number between 1 - 5" }

  def total
    self.votes.where(status: true).count - self.votes.where(status: false).count
  end

  def editable_by?(user)
    user == self.user || user.try(:admin?)
  end

  def destroyable_by?(user)
    user.admin?
  end
  
end
