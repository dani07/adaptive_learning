module AuthorizeUser
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    #Add all custom login specific to user login
  end
end