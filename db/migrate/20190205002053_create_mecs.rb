class CreateMecs < ActiveRecord::Migration[5.2]
  def change
    create_table :mecs do |t|
      t.references :privacy_criterium, foreign_key: true
      t.string :mec

      t.timestamps
    end
  end
end
