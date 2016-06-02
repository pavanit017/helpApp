module UserHelper

  #@user = User.new()

  def encrypt_password(password)
    passObj={}
    if password.present?
      passObj["password_salt"] = BCrypt::Engine.generate_salt
      passObj["password_hash"] = BCrypt::Engine.hash_secret(password , passObj["password_salt"])
    end
    return passObj;
  end


	def insertNewUser(userObj)
  	 	
  	 	returnObj={}
  	 	if User.where(email:userObj["userEmail"]).count > 0
  	 		returnObj["success"] = false
  	 		returnObj["message"] = "User with this email already present"
  	 		return returnObj

  	 	else 
  	 		encrypted_password = encrypt_password(userObj["userPass"])
        #binding.pry
  	 		u = User.new(:name => userObj["userName"], :email => userObj["userEmail"] , :password => encrypted_password["password_hash"], :password_salt=> encrypted_password["password_salt"]);
  	 		u.save

  	 		returnObj["success"] = true
  	 		returnObj["message"] = "User SignUp successfully"
  	 		#binding.pry
  	 		returnObj["data"] = u.id
  	 		return returnObj
  	 	end

  	 	#u.save		
		#binding.pry
	end 	
end
