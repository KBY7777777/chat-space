#応用カリNo92にて、メッセージ送信機能実装のためmessages_controllerを作成

class MessagesController < ApplicationController

  #下記set_groupの処理を行うbefore_actionを設定
  before_action :set_group

  #controller生成当初に記述されていた「index」アクションに、処理内容のコードを追記
  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  #応用カリNo92にて、メッセージ送信機能実装のためmessagesに「create」アクションを追記（詳細内容は追って追記）
  #同単元にて、詳細な処理内容を下記コードのとおり追記
  def create
    @message = @group.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  #さらにparams条件を追記
  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  #さらにset_groupを追記（冒頭記載のbefore_actionとする）
  def set_group
    @group = Group.find(params[:group_id])
  end

end
