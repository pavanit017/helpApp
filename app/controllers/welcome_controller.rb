class WelcomeController < ApplicationController


  def index
    #binding.pry
    if !session["user_id"].blank?
        @issueObjArr = view_context.createIssueObj
    else 
        redirect_to "/login"
    end
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

  def logout
    #binding.pry
    @_current_user = session[:user_id] = nil
    #binding.pry
    redirect_to "/login"
    #binding.pry
  end

  # def edit
  #     issueTopic = params[:issueTopic]
  #     issueDesc = params[:issueDesc]
  #     binding.pry
  #     issue = Issue.new(:topic => issueTopic , :desc => issueDesc , :status => "pending" , :statusdesc => "" );
  #     issue.save
  # end

  # def deleteIssue
  #     issueTopic = params[:issueTopic]
  #     issueDesc = params[:issueDesc]
  #     issue = Issue.new(:topic => issueTopic , :desc => issueDesc , :status => "pending" , :statusdesc => "" );
  #     issue.save
  # end
  
end
