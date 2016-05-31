class WelcomeController < ApplicationController
  #helper :all
  def index

  	# issueObj={}
  	# @issueObjArr = [];
  	# issueObj["id"] = 1
  	# issueObj["issue"] = "issue 1"
  	# issueObj["desc"] = "not yet"
  	# issueObj["up"] = true
  	# issueObj["down"] = false
  	# issueObj["created"] = false
  	# @issueObjArr.push(issueObj)
   #  #binding.pry
   #  issueObj={}
  	# issueObj["id"] = 2
  	# issueObj["issue"] = "issue 2"
  	# issueObj["desc"]= "not yet another"
  	# issueObj["up"] = false 
  	# issueObj["down"] = true
  	# issueObj["created"] = false
  	# @issueObjArr.push(issueObj)

    @issueObjArr = view_context.createIssueObj

    #binding.pry
  	#puts issueObjArr
    #render "addIssue"
    #issue = Issue.new(:topic => "good code practice", :desc => "need kt on good code practice" , :status => "pending" , :statusdesc => "" );
    #issue.save
    #addIssue
  end

  def new
      render "addIssue"
  end

  def create
      issueTopic = params[:issueTopic]
      issueDesc = params[:issueDesc]
      #binding.pry
      issue = Issue.new(:topic => issueTopic , :desc => issueDesc , :status => "pending" , :statusdesc => "" );
      #binding.pry
      issue.save
      redirect_to  "/welcome"
  end

  def upvote
    issueId = params[:id]
    userIssue= UserIssue.new(:issueId => issueId , :userId => 1, :created => false , :upvoted => true , :downvoted => false)
    userIssue.save
    redirect_to "/welcome"
  end

  def downvote
    issueId = params[:id]
    userIssue= UserIssue.new(:issueId => issueId , :userId => 1, :created => false , :upvoted => false , :downvoted => true)
    userIssue.save
    redirect_to "/welcome"
    #binding.pry

  end

  def edit
      issueTopic = params[:issueTopic]
      issueDesc = params[:issueDesc]
      binding.pry
      issue = Issue.new(:topic => issueTopic , :desc => issueDesc , :status => "pending" , :statusdesc => "" );
      issue.save
  end

  def deleteIssue
      issueTopic = params[:issueTopic]
      issueDesc = params[:issueDesc]
      issue = Issue.new(:topic => issueTopic , :desc => issueDesc , :status => "pending" , :statusdesc => "" );
      issue.save
  end
end
