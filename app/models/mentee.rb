class Mentee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email, :password, :password_confirmation, :dob, :bio, :name
  validates_uniqueness_of :email

  has_many :reviews
end
