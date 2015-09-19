class UsersController < ApplicationController

  before_action :authenticate_user!

  #def login
  #end

  #def logout
  #end

  def signup
  end

  def checkout
    @hardwares = ["Amazon Echo", "Moto 360", "Google Glass", "Raspberry Pi Model B+", "MHacks 6 Hacker Board"]
  end

  def checkout_submission
  end

  def view
  end
end
