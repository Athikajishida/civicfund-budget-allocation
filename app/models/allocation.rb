class Allocation < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :within_user_budget
  validate :within_project_request # Add this new validation

  private
  
  def within_user_budget
    return unless user && amount
    
    # Calculate total including this allocation
    total = user.allocations.where.not(id: id).sum(:amount) + amount.to_i
    
    if total > 1000
      errors.add(:amount, "Total allocations exceed your $1,000 budget")
    end
  end
  
  def within_project_request
    return unless project && amount
    
    if amount > project.cost
      errors.add(:amount, "exceeds project's requested amount of $#{project.cost}")
    end
  end
end