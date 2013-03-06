require 'net/ldap'

class LocalAuthenticator
  def self.authenticate(login, password)
    User.authenticate login, password
  end

  private

  def self.validate_parameter login, password
    not (login.empty? or password.empty?)
  end
end
