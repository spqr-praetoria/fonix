class DashboardController < ApplicationController
  def index
    @dashboard = DashboardService.new(current_user).fetch
  end
end
