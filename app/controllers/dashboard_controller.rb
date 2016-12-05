class DashboardController < ApplicationController
  def index
    @state = (rand(9000) + 1000).to_s
  end
end
