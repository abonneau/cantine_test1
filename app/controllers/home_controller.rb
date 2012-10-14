class HomeController < ApplicationController
	#load_and_authorize_resource
  def index
	  @users = User.all
	  @recettes = Recette.all
	end
end
