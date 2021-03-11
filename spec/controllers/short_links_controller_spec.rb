require 'rails_helper'

describe ShortLinksController do
  describe "show" do
    context "with a valid shortlink" do
      let(:short_link) {create(:short_link)}
      let(:request) {get :show, params: {id: short_link.slug}}
      it 'redirects to a long link' do
        expect(request.status).to eq(302)
        expect(request).to redirect_to(short_link.full_url)
      end 
    end

    context "with an invalid shortlink" do
      let(:request) {get :show, params: {id: -1}}
      it "returns 404" do
        expect(request.status).to eq(404)
      end
    end
  end
end