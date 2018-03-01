class Visit < ApplicationRecord
  def self.record_visit!(user, shortened_url_id)
    Visit.create!(user_id: user, shortened_url_id: shortened_url_id)
  end

  belongs_to :visitors,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :visited_url,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :shortened_url_id

end
