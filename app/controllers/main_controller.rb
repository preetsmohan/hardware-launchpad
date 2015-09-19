class MainController < ApplicationController
  def index
  end

  def inventory
  	@hardwares = []
  	Hardware.all.each do |hardware|
      puts "analyzing " + hardware.name
  		# Does hardware already exist in array?
  		if @hardwares.detect{|h| h["name"] == hardware.name}
  			hash = @hardwares.detect{|h| h["name"] == hardware.name}
        hash["requirescredit"] = hardware.requirescredit
        hash["description"] = hardware.description
  			hash["available"] += hardware.inuse ? 0 : 1 
  			hash["total"] += 1
  		# otherwise, add it
  		else
        puts "check out this new item! " + hardware.name 
  			@hardwares << {"name" => hardware.name, 
  				"available" => hardware.inuse ? 0 : 1, 
  				"total" => 1, "due" => "todo"}
  		end
  	end

  	# let's try some dummy data
  	#@hardwares << { "name" => "Amazon Echo", "available" => 5, 
  	#	"total" => 7, "due" => "Jan 1, 2016"}
  	#@hardwares << { "name" => "Moto 360", "available" => 20, 
  	#	"total" => 25, "due" => "Dec 1, 2015"}
  end
end
