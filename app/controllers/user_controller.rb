class UserController < ApplicationController

	def new
		@user = User.new();
	end
	
	def index 
		
	end

	def create
		userObj={}
		userObj["userName"]=params[:userName]
		userObj["userEmail"]=params[:userEmail]
		userObj["userPass"] = params[:userPassword]
		isUserCreated = view_context.insertNewUser(userObj)
		#binding.pry
		if isUserCreated["success"]==true
			session[:user_id] = isUserCreated["data"]
			redirect_to '/welcome'
		else 
			redirect_to '/signup'
		end

    	#redirect_to '/'
		
	end

end
