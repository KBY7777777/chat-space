#応用No92にて、メッセージ送信機能実装のためmessages_controllerを作成

class MessagesController < ApplicationController

  #下記set_groupの処理を行うbefore_actionを設定
  before_action :set_group

  #controller生成当初に記述されていた「index」アクションに、処理内容のコードを追記
  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  #応用No92にて、メッセージ送信機能実装のためmessagesに「create」アクションを追記（詳細内容は追って追記）
  #同単元にて、詳細な処理内容を下記コードのとおり追記
  def create
    @message = @group.messages.new(message_params)
    if @message.save
      #応用No108、「問題3」にて、createアクションの対応を分けるコードに書き換え
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
