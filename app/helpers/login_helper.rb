module LoginHelper
	def isUserLogin(loginObj)
  	 	
  	 	returnObj = {}
  	 	u = User.where(email: loginObj["userMail"])
  	 	#binding.pry
  	 	if u.size==0
  	 		returnObj["success"] = false
  	 		returnObj["message"] = "User for this email id not present please signup"
  	 		return returnObj
  	 	else
  	 		if u[0].password == BCrypt::Engine.hash_secret(loginObj["userPass"], u[0].password_salt)
  	 			returnObj["success"] = true
  	 			returnObj["message"] = "User login successfully"
  	 			returnObj["data"] = u[0].id
  	 			return returnObj
	 		else
	 			returnObj["success"] = false
  	 			returnObj["message"] = "User mail or password is incorrect"
  	 			return returnObj
	 		end
	 	end
	end 	
end
