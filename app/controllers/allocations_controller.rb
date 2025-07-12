class AllocationsController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.transaction do
      current_user.allocations.destroy_all

      params[:allocations].each do |project_id, amount|
        next if amount.to_i <= 0

        current_user.allocations.create!(
          project_id: project_id,
          amount: amount.to_i
        )
      end
    end

    redirect_to root_path, notice: "Your allocations have been saved."
  rescue ActiveRecord::RecordInvalid => e
    redirect_to root_path, alert: e.message
  end
end
