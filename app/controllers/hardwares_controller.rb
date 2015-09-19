class HardwaresController < ApplicationController

	def index
		@hardwares = Hardware.all
	end

	def show
    	@hardware = Hardware.find(params[:id])
  	end

	def new
  		@hardware = Hardware.new
	end
 
	def edit
  		@hardware = Hardware.find(params[:id])
	end

	def create
		@hardware = Hardware.new(hardware_params)

  		if @hardware.save
    		redirect_to @hardware
 		else
    		render 'new'
  		end
	end

	def update
  		@hardware = Hardware.find(params[:id])
 
  		if @hardware.update(hardware_params)
    		redirect_to @hardware
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@hardware = Hardware.find(params[:id])
  		@hardware.destroy
 
  		redirect_to hardwares_path
	end

	private
  		def hardware_params
    		params.require(:hardware).permit(:name, :description)
  		end
end
