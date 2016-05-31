class UserIssue < ActiveRecord::Base
  attr_accessible :created, :downvoted, :issueId, :upvoted, :userId
end
