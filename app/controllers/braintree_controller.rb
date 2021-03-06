class BraintreeController < ApplicationController

	protect_from_forgery except: :charge_post
	def charge
		@client_token = Braintree::ClientToken.generate
		#@client_token = Braintree::ClientToken.generate
		#puts "client token"				
		#puts @client_token		
		#@client_token = Braintree::ClientToken.generate(
		#	:customer_id => a_customer_id)
	end

	def client_token
		render plain: Braintree::ClientToken.generate
		#@client_token = Braintree::ClientToken.generate
		puts "client token"
		puts @client_token
	end

	def charge_post
		nonce = params[:payment_method_nonce]
		puts nonce

		result = Braintree::Customer.create(
			:first_name => current_user.first_name,
			:last_name => current_user.last_name,
			:phone => current_user.phone,
			:email => current_user.email,
			#:payment_method_nonce => "fake-valid-nonce")
			:payment_method_nonce => nonce);

		if result.success?
			puts "success"
			puts result.customer.id
			puts "token"
			puts result.customer.payment_methods[0].token
		else
			puts "nope, sorry"
			p result.errors
		end
	end

	def checkout
		nonce = params[:payment_method_nonce]
		# Use payment method nonce here...
		#puts nonce
	end

	def update_credit
		nonce = params[:payment_method_nonce]
		puts nonce

		puts params[:first]
		puts params[:last]
		puts params[:email]
		puts params[:phone]

		result = Braintree::Customer.create(
			:first_name => params[:first],
			:last_name => params[:last],
			:phone => params[:phone],
			:email => params[:email],
			:payment_method_nonce => "fake-valid-nonce")

		if result.success?
			puts "success"
			puts result.customer.id
			puts "token"
			puts result.customer.payment_methods[0].token
			user = User.find_by email: params[:email]
			user.hascredit = true
			user.braintreeid = result.customer.id
			user.save
			#current_user.hascredit = true
			#current_user.braintreeid = result.customer.id
			redirect_to :back
			#render plain: "success"
		else
			puts plain: "nope, sorry"
			p result.errors
			render plain: result.errors
		end
		
	end

end
