class DashboardController < ApplicationController
  def index
    @elections = Election.all
  end
end
