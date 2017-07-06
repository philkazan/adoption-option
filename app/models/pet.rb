class Pet < ApplicationRecord
  has_many :users, through: :apps
  has_many :apps
end
