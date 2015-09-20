class UsersController < ApplicationController

  before_action :authenticate_user!

  #def login
  #end

  #def logout
  #end

  def signup
  end

  def checkout
    # Find all available hardware by querying all hardware
    pp params
    @hardwares = []
    results = Hardware.select(:name).distinct
    pp results
    results.each do |result|
      @hardwares << result["name"]#.name#["name"]
      puts result.class.name
    end
    #@hardwares = ["Amazon Echo", "Moto 360", "Google Glass", "Raspberry Pi Model B+", "MHacks 6 Hacker Board"]
  end

  def checkout_submission
    pp params
    puts "options!"
    puts params[:options]
    checkout
  end

  def view
  end
end
