class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	def self.connect_to_linkedin(auth, signed_in_resource = nil)
		mentor = Mentor.where(:provider => auth.provider, :uid => auth.uid).first
		if mentor
			return mentor
		else
			registered_mentor = Mentor.where(:email => auth.info.email).first
			if registered_mentor
				return registered_mentor
			else
				mentor = Mentor.create(name:auth.info.first_name,
									provider:auth.provider,
									uid:auth.uid,
									email:auth.info.email,
									password:Devise.friendly_token[0,20])
			end
		end
	end
end
