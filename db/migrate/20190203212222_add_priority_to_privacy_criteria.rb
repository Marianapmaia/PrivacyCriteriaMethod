class AddPriorityToPrivacyCriteria < ActiveRecord::Migration[5.2]
  def change
    add_column :privacy_criteria, :priority, :string
  end
end
