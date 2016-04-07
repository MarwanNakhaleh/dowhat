class SessionsController < ApplicationController
	def create
		@mentor = Mentor.find_or_create_from_auth_hash(auth_hash)
		self.current_mentor = @mentor
		redirect_to root_url
	end

	protected

	def auth_hash
		request.env["omniauth.auth"]
	end
end		