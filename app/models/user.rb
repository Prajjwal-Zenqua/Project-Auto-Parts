class User < ApplicationRecord
  enum status: { seller: 0, buyer: 1 }
  # enum status: [:seller, :buyer]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end