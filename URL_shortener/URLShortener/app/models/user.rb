class User < ApplicationRecord
  validates :email, uniqueness: true
  validate :include_at_sign

  def include_at_sign
    unless email.include?("@")
      errors[:email] << "It's not an email"
    end
  end

  has_many :submitted_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls,
    through: :visits,
    source: :visited_url

end
