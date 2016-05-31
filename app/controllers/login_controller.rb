class LoginController < ApplicationController
  
  def index 

  end 

  def create
  	 userMail = params[:userMail]
  	 userPass = params[:userPass]
  	 u = User.where(email: userMail)
  	 #binding.pry
  	 @returnObj={}
  	 @successFlag=0;
	 
	 if u[0].password==userPass
	 	#@returnObj["success"] = true
	 	#@returnObj["message"] = "login successfull"
	 	#render "<p> Login successfull</p>"
	 	#render "login/loginSuccess"
	 	@successFlag=1
	 	redirect_to '/welcome'
	 else
	 	#@returnObj["success"] = false
	 	#@returnObj["message"] = "something went wrong"
	 	@successFlag=2
	 	# binding.pry
	 	flash[:error] = "Your book was not found"
	 	redirect_to '/login'
	 	
	 	#render "<p> something went wrong</p>"

	 end  

  	 u = User.new(:name => "pavan", :email => "pavan.k@nestaway.com" , :password => "12345678");
  	 u.save
  	 #binding.pry
  end

end
