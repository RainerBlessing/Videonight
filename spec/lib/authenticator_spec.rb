require 'spec_helper'
require 'authenticator'
require 'one_user_authenticator'
require 'ldap_authenticator'
require 'local_authenticator'

describe OneUserAuthenticator do
  it "can authenticate a user" do    
    Authenticator.setAuthenticator(OneUserAuthenticator)
    login = 'login'

    password = 'password'
    result = Authenticator.authenticate(login,password)
    result.should be_true

    password = 'wrong_password'
    result = Authenticator.authenticate(login,password)
    result.should be_false
  end
end

describe LdapAuthenticator do
  it "can authenticate a user" do    
    Authenticator.setAuthenticator(LdapAuthenticator)

    login = 'login'

    password = ''
    result = Authenticator.authenticate(login,password)
    result.should be_false


    password = 'password'

    LdapAuthenticator.expects(:create_connection).with(login,password).returns true

    result = Authenticator.authenticate(login,password)
    result.should be_true
  end
end

describe LocalAuthenticator do
  it "can authenticate a user" do    
    Authenticator.setAuthenticator(LocalAuthenticator)
    login = 'login'
    password = 'password'

    user = User.new(:login => login, :password => password)
    user.encrypt_password

    User.expects(:find_by_login).with(login).twice.returns user

    result = Authenticator.authenticate(login, password)
    result.should be_true

    password = 'wrong_password'
    result = Authenticator.authenticate(login,password)
    result.should be_false
  end
end


