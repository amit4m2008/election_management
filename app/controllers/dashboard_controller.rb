class DashboardController < ApplicationController
  def index
    @elections = Election.search(params)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
