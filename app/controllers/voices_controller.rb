class VoicesController < ApplicationController
  def create
    Voice.create(voice_params)

    redirect_to root_path
  end

 private
 # Rails4からStrongParamaterと呼ばれる機能が追加されました。
 # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
 def voice_params
   params.require(:voice).permit(:t)
 end
end
