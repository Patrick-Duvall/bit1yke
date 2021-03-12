class ShortLinkSerializer < ActiveModel::Serializer
  attributes :short_link, :full_url, :user_id, :visit_count
end