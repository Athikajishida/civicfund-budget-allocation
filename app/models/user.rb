class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :allocations
  has_many :projects, through: :allocations

  def total_allocated
    allocations.sum(:amount)
  end
  
  def remaining_budget
    1000 - total_allocated
  end
end
