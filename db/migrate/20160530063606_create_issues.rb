class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :topic
      t.text :desc
      t.string :status
      t.text :statusdesc

      t.timestamps
    end
  end
end
