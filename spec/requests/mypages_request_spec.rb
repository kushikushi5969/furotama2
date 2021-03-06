require 'rails_helper'

RSpec.describe "Mypages", type: :request do
  let(:user) { create(:user) }

  describe "show" do
    before do
      sign_in user
      get mypage_path(user.id)
    end
    example "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end
  end
end
