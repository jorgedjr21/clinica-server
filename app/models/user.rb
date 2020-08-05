class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :jwt_authenticatable, 
         jwt_revocation_strategy: JwtBlacklist

  validates_uniqueness_of :email
  validates_presence_of :name, :email, :password
  validates_length_of :name, :email, :password, minimum: 6
  validates :email, format: { with: Devise.email_regexp, message: I18n.t('activerecord.errors.models.user.attributes.email.valid_email') }
end
