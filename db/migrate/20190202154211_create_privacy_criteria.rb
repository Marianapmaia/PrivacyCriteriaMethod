class CreatePrivacyCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :privacy_criteria do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.string :id_pc
      t.string :requirement
      t.text :description
      t.string :source
      t.string :owner
      t.string :rel_owner
      t.string :processor
      t.string :rel_processor
      t.string :third
      t.string :rel_third
      t.string :privacy_preference
      t.string :privacy_compliance

      t.timestamps
    end
  end
end
