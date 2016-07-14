class PizzaShop < Sinatra::Base

require 'json'

	#INDEX get all pizza
	get '/pizza' do 
		Pizza.all.to_json
	end

	#SHOW a pizza
	get '/pizza/:id' do
		Pizza.find(params[:id]).to_json

	end

	#CREATE a pizza. 

	post '/pizza' do
		@make_pizza = JSON.parse(request.body.read)
		@new_pizza = Pizza.new(@make_pizza)
		@new_pizza.save

	end


	#UPDATE a pizza

	put '/pizza/:id' do
		things = JSON.parse(request.body.read)
		@zaa = Pizza.find(params[:id])
		@zaa.update_attributes(things)
	end


	#DELETE a pizza
	delete '/pizza/:id' do
		@zaa = Pizza.find(params[:id])
		@zaa.destroy
	end


end
