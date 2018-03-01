class ShortenedUrl < ApplicationRecord
  validates :long_url, uniqueness: true
  validates :short_url, uniqueness: true

  def self.insert_row(long_url, user_id)
    generated_code = self.random_code
    ShortenedUrl.create!(long_url: long_url, user_id: user_id, short_url: generated_code)
  end

  def self.random_code
    url = SecureRandom.urlsafe_base64(16)
    while ShortenedUrl.exists?(:short_url => url)
      url = SecureRandom.urlsafe_base64(16)
    end
    url
  end

  def num_clicks
    # clicks = shortened_url.select(self.id)
    self.visitors.count

  end

  def num_uniques
    self.unique_visitors.count
  end

  def num_recent_uniques
    Visit.where({ created_at: (Time.now - 10.minute)..Time.now}).count

  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_url_id

  has_many :visitors,
    through: :visits,
    source: :visitors

  has_many :unique_visitors,
    Proc.new{ distinct },
    through: :visits,
    source: :visitor
end
