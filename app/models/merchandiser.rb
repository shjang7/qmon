class Merchandiser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, inverse_of: :merchandiser, dependent: :destroy
  validates :email, :username, :owner_name, :business_name, :business_number, presence: true
  validates :contact_number, :company_address, presence: true
  validates :email, :username, :business_name, :business_number, uniqueness: true
  validates :username, length: { minimum: 4, maximum: 50 }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end

class Merchandiser::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up) do |u|
      u.permit({ roles: [] }, :email, :password, :username, :business_name, :owner_name, :contact_number, :business_number, :company_address)
    end
    permit(:account_update) do |u|
      u.permit({ roles: [] }, :email, :password, :current_password, :username, :business_name, :owner_name, :contact_number, :business_number, :company_address)
    end
  end
end
