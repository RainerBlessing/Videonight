class OneUserAuthenticator
  @login = 'login'
  @password = 'password'

  def self.authenticate(login, password)
    return @login == login && @password == password
  end
end
