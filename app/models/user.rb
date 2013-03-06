class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password

  has_many :events

  has_many :selections

  has_many :movies, :through => :selections

  ajaxful_rater

  validates_presence_of :login
  validates_uniqueness_of :login

  attr_accessor :password
  before_save :encrypt_password

  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
