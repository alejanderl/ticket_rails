class User < ActiveRecord::Base

  #virtual attributes
  attr_accessor :password
  attr_accessor :salt
  attr_accessor :encrypted_password

  #attrs modifiable by the outside world
  attr_accessible :name, :email, :password, :password_confirmation , :nickname , :image
  
  has_one:address
  accepts_nested_attributes_for :addresses


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validations
  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => true
  validates :password,  :presence     => true,
                        :confirmation => true,
                        :length       => { :within => 6..40 }
                        
  validates :nickname,  :presence     => true,
                        :length       => { :within => 3..20 },
                        :uniqueness => true

  #class method that authenticates a user, used to create a session cookie
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  #used to authenticate a signed user from a signed cookie 
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    return nil if user.nil?
    return user if user.salt == cookie_salt
  end

  #callback that occurs before a record is successfully saved (meaning it has a valid password)                      
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  private

    #self keyword is required when assigning to a instance attribute
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")      
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
