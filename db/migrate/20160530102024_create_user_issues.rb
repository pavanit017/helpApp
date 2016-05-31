class CreateUserIssues < ActiveRecord::Migration
  def change
    create_table :user_issues do |t|
      t.integer :issueId
      t.integer :userId
      t.boolean :created
      t.boolean :upvoted
      t.boolean :downvoted

      t.timestamps
    end
  end
end
