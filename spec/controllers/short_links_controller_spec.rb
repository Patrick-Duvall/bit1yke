require 'rails_helper'

describe ShortLinksController do
  describe 'show' do
    context 'with a valid short_link id' do
      let(:short_link) { create(:short_link) }
      let(:request) {get :show, params: {id: short_link.slug}}
      it 'redirects to a long link' do
        expect(request.status).to eq(302)
        expect(request).to redirect_to(short_link.full_url)
      end 

      it 'increments a short_links visit count' do
        expect(short_link.visit_count).to eq(0)
        request
        expect(short_link.reload.visit_count).to eq(1)
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

  describe 'post' do
    let(:short_link) {create(:short_link)}
    let(:valid_url) { 'https://www.fakegoogle.com' }
    context 'with a valid request' do
      describe 'when no short_link with the same id and url exists' do
        let(:request) { post :create, params: { user_id: short_link.user_id + 1, full_url: valid_url}
        }
        it 'creates a short_link' do
          expect(request.status).to eq(201)
          expect(parsed_response.keys).to contain_exactly(
          "short_link", "full_url", "user_id", "visit_count"
        )
        end
      end

      describe 'when a short_link with the same url but different user_id exists' do
        let(:request) { post :create, params: { user_id: short_link.user_id, full_url: valid_url }}
        it 'creates a short_link' do
          expect(request.status).to eq(201)
        end
      end
    end

    context 'with an invalid request' do
      describe 'when a short_link with the same url AND user_id exists' do
        let(:request) { post :create, params: { user_id: short_link.user_id, full_url: short_link.full_url }}
        it 'does not create a short_link' do
          expect(request.status).to eq(422)
        end
      end

      describe 'when a url is invalid' do
        let(:request) { post :create, params: { user_id: short_link.user_id, full_url: 'abc123' }}
        it 'does not create a short_link' do
          expect(request.status).to eq(422)
        end
      end

      describe 'when a url is not provided' do
        let(:request) { post :create, params: { user_id: short_link.id + 1 }}
        it 'does not create a short_link' do
          expect(request.status).to eq(422)
        end
      end

      describe 'when a user_id is not provided' do
        let(:request) { post :create, params: { full_url: valid_url }}
        it 'does not create a short_link' do
          expect(request.status).to eq(422)
        end
      end
    end
  end
end