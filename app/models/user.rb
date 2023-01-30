class User < ApplicationRecord

  has_secure_password

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 6}
  
end
