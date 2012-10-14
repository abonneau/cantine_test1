module RecettesHelper

	def affichage_bouttons?
		current_user.has_role? :admin or current_user == @recette.user
	end
end
