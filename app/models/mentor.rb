class Mentor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_or_create_from_auth_hash(auth_hash)
  	mentor = Mentor.where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
  	mentor.update(
  		name: auth_hash.extra.raw_info.name,
  		token: auth_hash.credentials.token,
  		secret: auth_hash.credentials.secret)
  end
end
