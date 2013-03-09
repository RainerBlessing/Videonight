require 'spec_helper'
#lib files are included in initializers/01_authenticator.rb

describe OneUserAuthenticator do
  before(:all) do
    @originalAuthenticator = Authenticator.authenticator
  end
  
  after(:all) do
    Authenticator.authenticator= @originalAuthenticator
  end

  it "can authenticate a user" do    
    Authenticator.authenticator=OneUserAuthenticator
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
    Authenticator.authenticator=LdapAuthenticator

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
    Authenticator.authenticator=LocalAuthenticator
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
