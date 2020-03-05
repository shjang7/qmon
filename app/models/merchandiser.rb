class Merchandiser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, inverse_of: :merchandiser, dependent: :destroy
  validates :username, :business_name, :business_number, uniqueness: true
  validates :username, :business_name, :owner_name, :business_number, presence: true
  validates :contact_number, :company_address, presence: true
  validates :username, length: { minimum: 4, maximum: 50 }
end
