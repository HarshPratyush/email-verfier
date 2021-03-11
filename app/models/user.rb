class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise   :omniauthable, omniauth_providers: [:google_oauth2]
  validates_uniqueness_of :email
  validates_presence_of :role
  validates_presence_of :name

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.role = 'CLIENT'
      user.email = auth.info.email
      user.save
    end
  end

end
