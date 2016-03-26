class HomeController < ApplicationController
	layout "lmc_layout"
  def index
  end

  def index_admin
  	render "users/sessions/new_admin.html.erb"
  end

  def index_user
  	render "users/sessions/new.html.erb"
  end

  def registration
  end
end
