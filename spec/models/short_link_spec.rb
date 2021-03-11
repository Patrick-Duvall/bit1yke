require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  subject { create(:short_link) }
  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:full_url) }
    it { should validate_uniqueness_of(:full_url).scoped_to(:user_id) }
  end

  describe 'class methods' do

  end

  describe 'instance methods' do
    it '.slug ' do
      expect(subject.slug).to eq(subject.id.to_s(36))
    end
    it '.short_link' do
      expect(subject.short_link).to eq(ENV["DOMAIN_NAME"] + subject.id.to_s(36))
    end
  end
end
