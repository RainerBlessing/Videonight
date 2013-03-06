if Rails.env.test? || Rails.env.development?
  require "mocha/version"
  require "mocha/deprecation"
end
