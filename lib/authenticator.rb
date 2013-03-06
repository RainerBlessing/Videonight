class Authenticator
  def self.setAuthenticator(realAuthenticator)
    @RealAuthenticator = realAuthenticator
  end
  def self.authenticate(login, password)
    return @RealAuthenticator.authenticate(login, password)
  end
end
