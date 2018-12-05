class ColognesController < ApplicationController
  #イベント
  def event
    @cologne = Cologne.new

    binding.pry
    # 追加
    if params[:submit] == 'Add'
      # 名前
      @cologne[:name] = params[:cologne][:name]
      # メーカ
      @cologne[:maker] = params[:cologne][:maker]
      # お気に入り
      @cologne[:favourite] = params[:cologne][:favourite]
      # 成分
      @cologne[:component] = params[:cologne][:component]
      # 写真
      @cologne[:picture] = params[:cologne][:picture]
      # 感想
      @cologne[:note] = params[:cologne][:note]
      # 購入情報
      @cologne[:info] = params[:cologne][:info]

      # 保存
      @cologne.save

      # indexに遷移
      redirect_to :action => 'index'
    end
  end

  # 追加
  def new
    @cologne = Cologne.new
 
    #ボタンのラベル
    @button_label = "追加"
    #ボタンのアクション
    @button_action = "create"
  end

  # 修正
  def edit
    # 検索
    @cologne = Cologne.find(params[:id])

    #ボタンのラベル
    @button_label = "更新"
    #ボタンのアクション
    @button_action = "Update"
  end

  def show
      @cologne = find_cologne_by_id

      # 名前
#      @cologne[:name] = params[:cologne][:name]
      # メーカ
#      @cologne[:maker] = params[:cologne][:maker]
      # お気に入り
#      @cologne[:favourite] = params[:cologne][:favourite]
      # 成分
#      @cologne[:component] = params[:cologne][:component]
      # 写真
#      @cologne[:picture] = params[:cologne][:picture]
      # 感想
#      @cologne[:note] = params[:cologne][:note]
      # 購入情報
#      @cologne[:info] = params[:cologne][:info]

      # 更新
#      @cologne.save

      # indexに遷移
#      redirect_to :action => 'index'
  end

  # 削除
  def destroy
    @cologne = find_cologne_by_id
    @cologne.destroy

    # indexに遷移
    redirect_to colognes_path
  end

  # リスト
  def index
    @colognes = Cologne.all
  end
  
  # 追加
  def create
    @cologne = Cologne.new
    @cologne.create(params[:cologne])
    #ボタンのラベル
    @button_label = "登録"
    #ボタンのアクション
    @button_action = "Add"
    
    # indexに遷移
    redirect_to colognes_path
  end

  # 更新
  def update
    @cologne = find_cologne_by_id    

    @cologne.update(params.require(:cologne).permit(:name, :maker, :favourite, :component, :note, :info, :filename))
    
    # 写真のアップロードと保存
    if params[:cologne].has_key? :picture
      @cologne.picture = params[:cologne]["picture"].read
      @cologne.filename = params[:cologne]["picture"].original_filename
      @cologne.save
    end

    # indexに遷移
    redirect_to colognes_path
  end

  # 写真の画像表示
  def send_img
    @cologne = find_cologne_by_id

    if @cologne.picture != nil
      send_data @cologne.picture, type: "image/jpeg", disposition: :inline
    end
  end

  # メンバーメソッド
  private
  # CologneのID検索
  def find_cologne_by_id
    Cologne.find(params[:id])
  end
end
