FactoryBot.define do
  module ControllerMacros
    def login_user
      # before each test, create and login the user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryBot.create(:user)
        # user.confirm! # Or set a confirmed_at inside the factory. Only if using "confirmable" module.
        sign_in user
      end
    end
    # Not used in this tutorial, but left to show an example of different user types
    # def login_admin
    #   before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
    #   end
    # end
  end
end
