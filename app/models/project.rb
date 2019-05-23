class Project < ApplicationRecord
  belongs_to :user
  has_many :privacy_criteria, dependent: :destroy
  has_many :share, dependent: :destroy
end
