class SessionsController < ApplicationController
	def create
		@mentor = Mentor.find_or_create_from_auth_hash(request.env["omniauth.auth"])
		self.current_mentor = @mentor
		redirect_to root_url
	end
end		