class User < ActiveRecord::Base
  devise :token_authenticatable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :lists, dependent: :destroy


  def clear_authentication_token!
    update_attribute(:authentication_token, nil)
  end

end
