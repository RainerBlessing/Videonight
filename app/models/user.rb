class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password

  has_many :events

  has_many :selections

  has_many :movies, :through => :selections

  ajaxful_rater

  ### BEGIN CONFIGURATION ###
  SERVER = '10.6.2.240'         # Active Directory server name or IP
  PORT = 389                    # Active Directory server port (default 389)
  BASE = 'DC=intershopnet'    # Base to search from
  DOMAIN = 'intershopnet'        # For simplified user@domain format login
  ### END CONFIGURATION ###

  def self.authenticate(login, password)
   return false if login.empty? or password.empty?
 
    conn = Net::LDAP.new :host => SERVER,
                         :port => PORT,
                         :base => BASE,
                         :auth => { :username => "#{login}@#{DOMAIN}",
                                    :password => password,
                                    :method => :simple }
    if conn.bind
      return self.new(:login => login)
    else
      return nil
    end

  # If we don't rescue this, Net::LDAP is decidedly ungraceful about failing
  # to connect to the server. We'd prefer to say authentication failed.
  rescue Net::LDAP::LdapError => e
    return false
  end
end
