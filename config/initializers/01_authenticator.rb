Dir[Rails.root.to_s + '/lib/*authenticator.rb'].each do |file|
  require File.basename(file,'.*')
end
Authenticator.authenticator= (APP_CONFIG['authenticator']+'_authenticator').camelize.constantize
