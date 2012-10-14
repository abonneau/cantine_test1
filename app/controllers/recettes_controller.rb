class RecettesController < InheritedResources::Base
	#before_filter :authenticate_user!, :only => [:new, :create, :edit, :destroy]
	#before_filter :authorized_user, :only => [:edit, :destroy]

	load_and_authorize_resource
	#skip_authorize_resource :only => [:new, :create]

	def index
	    @recettes = Recette.all
	end


	def new
		@recette = current_user.recettes.new	   
    end

    def create
    	@recette = current_user.recettes.build(params[:recette])
    	@recette.save
    	redirect_to root_path
    end

    



	def destroy
		@recette.destroy
		redirect_to root_path
	end


	

	private
		def authorized_user
	      @recette = Recette.find(params[:id])
	      redirect_to root_path unless current_user == @recette.user
	    end
end
