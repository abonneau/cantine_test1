class HomeController < ApplicationController
	#load_and_authorize_resource
  def index
	  @users = User.all
	  @recettes = Recette.paginate(:page => params[:page], :per_page => 5)
	end
end
