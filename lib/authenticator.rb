class Authenticator
  def self.authenticator=(realAuthenticator)
    @RealAuthenticator = realAuthenticator
  end
  def self.authenticator
    @RealAuthenticator
  end
  def self.authenticate(login, password)
    return @RealAuthenticator.authenticate(login, password)
  end
end
