class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # Other code, such as Devise modules
          has_many :bookings, dependent: :destroy
            # Vulnerable: Storing the password in plaintext
            attr_accessor :password
end
