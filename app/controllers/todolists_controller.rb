class TodolistsController < ApplicationController

  # newアクション
  def new
    # ＠はインスタンス変数
    @list = List.new
    # 右辺のListはモデル名でnewアクションを定義している
  end


  # クリエイトアクション
  def create
    # データを新規登録するためのインスタンス
    list = List.new(list_params)
    list.save
    # 保存する
    redirect_to todolist_path(list.id)
    # 遷移するURL
  end


  def index
    # @はこのクラスのインスタンス変数
    # Listはモデル名
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
  end


  private
  # ストロングパラメータ
  # ここより下はコントローラー内でしか呼び出せない
  # セキュリティ上の理由によりprivateの下に情報を管理するコードは記述する
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
