require 'rails_helper'

describe AnalyticsController do
  describe 'show' do
    context 'when passed a short_links slug' do
      let(:short_link) { create(:short_link) }
      let(:request) {get :show, params: {id: short_link.slug}}
      it 'returns the long_link and times visited' do
        expect(request.status).to eq(200)
        expect(JSON.parse(response.body).keys).to contain_exactly(
          "short_link", "full_url", "user_id", "visit_count"
        )
      end
    end

    context 'when no corresponding short_link exists' do
      let(:request) {get :show, params: {id: -1}}
      it 'returns 404' do
        expect(request.status).to eq(404)
      end
    end
  end
end