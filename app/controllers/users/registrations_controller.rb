class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :check_guest, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      flash[:success] = 'ユーザーが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: '編集しました'
    else
      redirect_to edit_user_registration_path, alert: '必須項目を入力してください'
    end
  end

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to mypage_path(@user.id), alert: 'ゲストの情報は編集できません'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :profile, :password )
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

end
