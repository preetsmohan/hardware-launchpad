class MainController < ApplicationController
  def index
  end

  def inventory
  	@hardwares = []
  	# let's try some dummy data
  	@hardwares << { "name" => "Amazon Echo", "available" => 5, 
  		"total" => 7, "due" => "Jan 1, 2016"}
  	@hardwares << { "name" => "Moto 360", "available" => 20, 
  		"total" => 25, "due" => "Dec 1, 2015"}
  end
end
