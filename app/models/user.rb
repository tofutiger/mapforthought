class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	ROLES = %i[admin user]  	
  
	has_many :trip_images, :dependent => :destroy
 	has_and_belongs_to_many :locations
 	accepts_nested_attributes_for :locations, :trip_images, :allow_destroy => true

 	
	has_attached_file :avatar, :styles => { :medium => "300x250>", :small  => "150x100", :thumb => "100x100>" }, :default_url => "/images/default_small_avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 	
  has_attached_file :photo, :styles => { :medium => "500x300>", :small  => "150x100", :thumb => "100x100>" }, :default_url => "/images/default_small_avatar.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true, length: { maximum: 25 }
  #validates :provider, presence: true, length: { maximum: 25 }
  #validates :scholarships, presence: true, length: { maximum: 25 }
	validates :email, presence: true, length: { maximum: 50 }
	attr_accessible :name, :email, :username, :password, :photo, :description, :roles, :provider, :scholarships, :avatar, :user_id, :photo, :locations_attributes, :trip_images
	
	
  
  
  
  def roles=(roles)
  roles = [*roles].map { |r| r.to_sym }
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  end
  end

  def has_role?(role)
    roles.include?(role)
  end

end