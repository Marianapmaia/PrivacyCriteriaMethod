class CreatePersonalInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_informations do |t|
      t.references :privacy_criterium, foreign_key: true
      t.string :tipo
      t.string :list
      t.text :desc

      t.timestamps
    end
  end
end
