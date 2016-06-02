class AddSolutionToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :solution, :text
  end
end
