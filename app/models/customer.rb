class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recent_views, inverse_of: :product, dependent: :destroy

  validates :username, uniqueness: true
  validates :username, :contact_number, :address, presence: true
  validates :username, length: { minimum: 4, maximum: 50 }

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end

class Customer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up) do |u|
      u.permit({ roles: [] }, :username, :password, :name, :contact_number, :address)
    end
    permit(:account_update) do |u|
      u.permit({ roles: [] }, :username, :password, :current_password, :name, :contact_number, :address)
    end
  end
end
