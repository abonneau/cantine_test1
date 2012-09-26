module ApplicationHelper

	def users
		@users = User.all
	end
end
