class LoginController < ApplicationController
  
  def index 

  end 

  def create
  	loginObj={}
  	 loginObj["userMail"] = params[:userMail]
  	 loginObj["userPass"] = params[:userPass]
  	 
  	 #binding.pry
  	 @returnObj={}
  	 #@successFlag=0;

	 isUserLogin = view_context.isUserLogin(loginObj)
		#binding.pry
		if isUserLogin["success"]==true
			session[:user_id] = isUserLogin["data"]
     # binding.pry
			redirect_to '/welcome'
		else 
			redirect_to '/login'
		end

	  
  	 #binding.pry
  end

end
