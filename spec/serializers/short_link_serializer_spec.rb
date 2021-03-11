require 'rails_helper'

describe ShortLinkSerializer do
  subject{ described_class.new(create(:short_link)) }

  describe 'attributes' do
    it 'serializes a short_link' do
      expect(subject.attributes.keys).to contain_exactly(:short_link, :full_url, :user_id)
    end
  end
end