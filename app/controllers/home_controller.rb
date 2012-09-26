class HomeController < ApplicationController
  def index
	  @users = User.all
	  @recettes = Recette.all
	end
end
