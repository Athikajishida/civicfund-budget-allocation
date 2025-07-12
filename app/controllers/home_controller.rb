class HomeController < ApplicationController
 before_action :authenticate_user!

  def index
    @projects = Project.all
    @allocations = current_user.allocations.index_by(&:project_id)
    @remaining = 1000 - @allocations.values.sum(&:amount)
  end
end
