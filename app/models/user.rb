class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	#has_secure_password
	
	has_many :trip_images, :dependent => :destroy
 	has_and_belongs_to_many :locations
 	accepts_nested_attributes_for :locations, :trip_images, :allow_destroy => true
 	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_small_avatar.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 	
	validates :name, presence: true, length: { maximum: 25 }
	validates :email, presence: true, length: { maximum: 50 }
	attr_accessible :name, :email, :username, :password, :description, :provider, :scholarships, :avatar, :user_id, :photo, :locations_attributes
	
	
   
end