class Users::SessionsController < Devise::SessionsController

  def destroy
    reset_session
    redirect_to root_path
    flash[:success] = 'ログアウトしました。'
  end

  # 簡単ログイン
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'ゲスト', profile: 'よろしくお願いします！') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path
    flash[:success] = 'ゲストでログインしました。'
  end

end
