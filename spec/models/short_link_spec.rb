require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  subject { create(:short_link) }
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:full_url) }
    it { should validate_uniqueness_of(:full_url).scoped_to(:user_id) }

    it 'validates format of email' do
      short_link = build(:short_link, user_id: subject.user_id, full_url: 'no good')
      expect(short_link.invalid?)
      expect(short_link.errors.full_messages).to eq(['Full url Please provide a valid url with protocol'])
    end
  end

  describe 'class methods' do
    it '#find_by_slug finds a ShortLink by its slug' do
      expect(described_class.find_by_slug(subject.slug)).to eq(subject)
    end
  end

  describe 'instance methods' do
    it '.slug shows a ShortLinks slug from its id' do
      expect(subject.slug).to eq(subject.id.to_s(36))
    end
    it '.short_link concatenates the url_base and slug' do
      expect(subject.short_link).to eq(ENV["DOMAIN_NAME"] + subject.slug)
    end
  end
end
