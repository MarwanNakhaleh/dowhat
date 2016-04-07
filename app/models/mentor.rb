class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.connect_to_linkedin(auth, signed_in_resource=nil)
  	user = Mentor.where(provider: auth.provider, uid: auth.uid).first_or_create
  	user = Mentor.create(name:auth.info.first_name,
  							provider:auth.provider,
  							uid:auth.uid,
  							email:auth.info.email,
  							password:Devise.friendly_token[0,20],
  							)
  	user.save!
  	redirect_to root_url
  end

#  	if user
#  		user.save!
#  		return user
#  	else
#  		registered_user = Mentor.where(:email => auth.info.email).first_or_create
#  		if registered_user
#  			return registered_user
#  		else
#  			user = Mentor.create(name:auth.info.first_name,
#  							provider:auth.provider,
#  							uid:auth.uid,
#  							email:auth.info.email,
#  							password:Devise.friendly_token[0,20],
#  							)
#  			user.save!
#  			redirect_to root_url
#  		end
#  	end
#  end
end
