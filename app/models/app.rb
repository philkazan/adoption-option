class App < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :pet_id, presence: true, numericality: { only_integer: true }
  validates :created_at, null: false
  validates :updated_at, null: false
end
