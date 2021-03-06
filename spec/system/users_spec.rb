require "rails_helper"

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ユーザー登録ページ" do
    before do
      visit new_user_registration_path
    end

    context "フォームの入力が正しい時" do
      example "登録に成功し、フラッシュメッセージを表示する" do
        fill_in "user[name]", with: "name"
        fill_in "user[email]", with: "test@example.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "アカウント作成"
        expect(page).to have_content "ユーザーが作成されました。"
      end
    end
  end

  describe "ログインページ" do
    before do
      visit new_user_session_path
    end

    context "フォームの入力が正しい時" do
      example "ログインに成功し、フラッシュメッセージを表示する" do
        fill_in "user[email]", with: "#{user.email}"
        fill_in "user[password]", with: "password"
        click_button "入場"
        expect(current_path).to eq root_path
        expect(page).to have_content "ログインしました。"
      end
    end

    context "パスワードの入力が誤っている時" do
      example "ログインに失敗し、フラッシュメッセージを表示する" do
        fill_in "user[email]", with: "#{user.email}"
        fill_in "user[password]", with: "pass"
        click_button "入場"
        expect(page).to have_content "Eメールまたはパスワードが違います。"
      end
    end
  end
end
