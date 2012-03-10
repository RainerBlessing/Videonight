class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :password

  has_many :events

  has_many :selections

  has_many :movies, :through => :selections

  ajaxful_rater

  def self.authenticate(login, password)
   return false if login.empty? or password.empty?
 
    conn = Net::LDAP.new :host => APP_CONFIG['server'],
                         :port => APP_CONFIG['port'],
                         :base => APP_CONFIG['base'],
                         :auth => { :username => "#{login}@#{APP_CONFIG['domain']}",
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
