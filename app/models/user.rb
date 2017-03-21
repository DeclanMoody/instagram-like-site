class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  def self.search(search)
    where("email LIKE ? OR username LIKE ?", "%#{search}%", "%#{search}%")
  end
end
