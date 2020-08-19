#応用カリNo91にて、グループ管理機能の実装でCを作成

class GroupsController < ApplicationController

  #rootパスに対する表示をmessages#indexとして進めてきたところを、
  #viewのデザインに入ってgroups#indexとすることに伴い、このcontrollerにindexアクションを追記
  def index
  end

  #グループの新規登録に必要となる「new」と「create」のアクションを定義
  def new
    #@groupに空のインスタンスを代入する（form_withで使用するためのインスタンス変数）
    @group = Group.new
    #インスタンス変数@groupに、ログインuserの情報を追加する
    @group.users << current_user
  end

  def create
    #送信データのparamsを確認するためのpry設定
    # binding.pry

    #新規グループの登録、保存動作の成否によって処理を分ける条件分岐
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  #グループ情報の編集に関するアクション
  def edit
    @group = Group.find(params[:id])
  end

  #グループ情報の編集後の、更新に関するアクション
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  #ストロングパラメータの設定
  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
