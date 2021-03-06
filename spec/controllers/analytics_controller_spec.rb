require 'rails_helper'

describe AnalyticsController do
  describe 'show' do
    context 'when passed a short_links slug' do
      let(:short_link) { create(:short_link) }
      let(:request) {get :show, params: {id: short_link.slug}}
      it 'returns the long_link and times visited' do
        expect(request.status).to eq(200)
        expect(parsed_response.keys).to contain_exactly(
          "short_link", "full_url", "user_id", "visit_count"
        )
      end
    end

    context 'when no corresponding short_link exists' do
      let(:request) {get :show, params: {id: -1}}
      it 'returns 404' do
        expect(request.status).to eq(404)
      end
      it 'links to the documentation url' do
        request
        expect(parsed_response).to eq(
          {
            "message" => "Not Found",
            "documentation_url" => ENV["DOCUMENTATION_URL"]
          }
        )
      end
    end
  end
end