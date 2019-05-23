class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable #: recoverable,
          
  has_many :projects, dependent: :destroy
  has_many :share, dependent: :destroy
end
