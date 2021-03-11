class ShortLink < ApplicationRecord
  validates :user_id, presence: true
  validates :full_url, presence: true, uniqueness: { scope: :user_id,
    message: 'A shortlink already exists for that user and URL' }
  validates :full_url, format: { with: URI::regexp,
    message: 'Please provide a valid url with protocol' }

  def self.find_by_slug(slug)
    id = slug.to_i(36)
    ShortLink.find_by(id: id)
  end

  def slug
    id.to_s(36)
  end

  def short_link
    ENV["DOMAIN_NAME"] + slug
  end
end