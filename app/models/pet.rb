class Pet < ApplicationRecord
  has_many :users, through: :apps
  has_many :apps

  validates :name, presence: true
  validates :animal, presence: true
  validates :size, presence: true
  validates :sex, presence: true
  validates :location, presence: true
  validates :age, presence: true
  validates :image, presence: true
  validates :description, presence: true

end
