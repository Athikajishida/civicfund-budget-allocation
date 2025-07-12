class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
  @projects_with_allocations = Project
  .left_joins(:allocations)
  .group('projects.id')
  .select('projects.*, COALESCE(SUM(allocations.amount), 0) as total_allocated')

  end

end
