class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
	def linkedin
		auth = ENV["omniauth.auth"]
		@mentor = Mentor.connect_to_linkedin(request.env["omniauth.auth"], current_mentor)
		if @mentor.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
			sign_in @mentor, :event => :authentication
			redirect_to root_url
		else
			session["devise.linkedin_uid"] = request.env["omniauth.auth"]
			redirect_to new_mentor_registration_url
		end
	end
end
