module WelcomeHelper
	def createIssueObj
		allIssueObj = {}
		allIssueObjArr = []
		allIssue=Issue.all
		allIssue.each do |t|
			upvoteCount = UserIssue.where("issueId = ? AND upvoted = ?", t["id"],true).count
			downvoteCount = UserIssue.where("issueId = ? AND downvoted = ?", t["id"],true).count
			allIssueObj["id"]=t["id"]
			allIssueObj["topic"]=t["topic"]
			allIssueObj["desc"]= t["desc"]
			allIssueObj["status"] = t["status"]
			allIssueObj["statusdesc"] = t["statusdesc"]
			allIssueObj["upvote"] = upvoteCount
			allIssueObj["downvote"] = downvoteCount
			allIssueObjArr.push(allIssueObj)
			allIssueObj = {}
		end 
		return allIssueObjArr
		#binding.pry
	end 
end
