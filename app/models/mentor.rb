class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
	def self.connect_to_linkedin(auth)
		user = Mentor.where(:provider => auth.provider, :uid => auth.uid).first
		if user
			return user
		else
			registered_user = Mentor.where(:email => auth.info.email).first
			if registered_user
				return registered_user
			else
				full_name = "#{auth.info.first_name} #{auth.info.last_name}"
				user = Mentor.create(name:auth.info.first_name,
							occupation:auth.info.headline, 
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
			end
		end
	end

end
