class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
	def linkedin
		auth = env["omniauth.auth"]
		@user = Mentor.connect_to_linkedin(request.env["omniauth.auth"])
		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
			sign_in_and_redirect @user, :event => :authentication
		else
			session["devise.linkedin_uid"] = request.env["omniauth.auth"]
			redirect_to new_mentor_registration_url
		end
	end
end