require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let!(:user) { create(:user) }

  describe 'index' do
    before do
      sign_in user
      get notifications_path
    end
    example 'リクエストが成功すること' do
      expect(response).to have_http_status(200)
    end
  end
end
