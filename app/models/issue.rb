class Issue < ActiveRecord::Base
  attr_accessible :desc, :status, :statusdesc, :topic

  issue= Issue.all()
  puts issue

end
