class CreateRisks < ActiveRecord::Migration[5.2]
  def change
    create_table :risks do |t|
      t.references :privacy_criterium, foreign_key: true
      t.string :vul
      t.string :thread
      t.string :harm

      t.timestamps
    end
  end
end
