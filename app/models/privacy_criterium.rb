class PrivacyCriterium < ApplicationRecord
  belongs_to :project
  has_many :personal_information, dependent: :destroy
  has_many :risk, dependent: :destroy
  has_many :mec, dependent: :destroy
end
