class UsersController < ApplicationController
   #before_filter :authenticate_user!, :except => [:index, :show]
   load_and_authorize_resource


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @liste_recettes = @user.recettes.paginate(:page => params[:page], :per_page => 5)
  end
  
end
