class User < ActiveRecord::Base
  rolify :role_cname => 'Administrator'
  rolify :role_cname => 'Manager'
  rolify :role_cname => 'Registered'
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  before_create :setup_default_role_for_new_users
  
  def setup_default_role_for_new_users
    if !self.has_any_role?
      self.add_role :registered
    end
  end
end
