class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :queue
      t.text :fix

      t.timestamps null: false
    end
  end
end
