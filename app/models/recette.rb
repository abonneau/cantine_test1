class Recette < ActiveRecord::Base
  attr_accessible :description, :ingredients, :preparation, :titre

  belongs_to :user

  validates :user_id, :presence => true

  default_scope :order => 'recettes.created_at DESC'




  	def user_name
  		if user_id.nil? or user_id == 0
			'Personne ! recette orpheline... oooooh'
		else
			user = User.find(user_id)
			user.name
		end
	end


end
