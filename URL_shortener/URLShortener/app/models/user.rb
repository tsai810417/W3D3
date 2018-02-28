class User < ApplicationRecord
  validates :email, uniqueness: true
  validate :include_at_sign

  def include_at_sign
    unless email.include?("@")
      errors[:email] << "It's not an email"
    end
  end
end
