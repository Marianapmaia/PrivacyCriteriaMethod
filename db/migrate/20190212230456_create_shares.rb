class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :accessa

      t.timestamps
    end
  end
end
