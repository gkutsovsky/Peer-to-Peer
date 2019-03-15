class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :user_buildings
  has_many :buildings, through: :user_buildings
  has_many :shareable
  def profile
    super || create_profile
  end
end
