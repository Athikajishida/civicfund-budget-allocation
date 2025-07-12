class Project < ApplicationRecord
  has_many :allocations
  has_many :users, through: :allocations

  validates :name, presence: true
  validates :cost, numericality: { greater_than: 0 }
end
