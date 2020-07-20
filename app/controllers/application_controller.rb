class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

	protected
	# サインイン後ルートパスへ移動
  def after_sign_in_path_for(resource)
    root_path
  end
 	# サインアウト後ルートパスへ移動
  def after_sign_out_path_for(resource)
    root_path
  end
  # サインアップ時、名前、年齢、性別の入力許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex])
  end
end
