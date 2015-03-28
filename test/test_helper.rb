ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  #TODO: move out it to helper file
  def login_user(user = nil, test_context = {})
    user ||= @user
    @controller.send(:auto_login, user)
    @controller.send(:after_login!, user, [user.send(user.sorcery_config.username_attribute_names.first), 'secret'])
  end

  def logout_user
    @controller.send(:logout)
  end

  def logged_in?
    @controller.send(:logged_in?)
  end
end
