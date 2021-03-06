require 'rails_helper'

RSpec.describe "Searches", type: :request do
  let (:user) { create(:user) }

  describe "index" do
    before do
      sign_in user
      get searches_path
    end
    example "リクエストが成功すること" do
      expect(response).to have_http_status(200)
    end
  end
end
