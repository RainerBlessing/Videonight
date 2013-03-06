require 'net/ldap'

class LdapAuthenticator
  def self.authenticate(login, password)
    if self.validate_parameter login, password
     self.create_connection login, password
    end
  end

  private

  def self.create_connection login, password
    conn = Net::LDAP.new :host => APP_CONFIG['server'],
      :port => APP_CONFIG['port'],
      :base => APP_CONFIG['base'],
      :auth => { :username => "#{login}@#{APP_CONFIG['domain']}",
        :password => password,
        :method => :simple }
    conn.bind ? true : false
    # If we don't rescue this, Net::LDAP is decidedly ungraceful about failing
    # to connect to the server. We'd prefer to say authentication failed.
  rescue Net::LDAP::LdapError => e
    return false
  end

  def self.validate_parameter login, password
    not (login.empty? or password.empty?)
  end
end
