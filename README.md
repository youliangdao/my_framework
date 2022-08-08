# my_framework
## 概要
フレームワークへの理解を深めるために、Sinatra風のフレームワークを自作した際のリポジトリです。

現在はクエリ文字列を含むGETリクエストに対応しており、簡単な静的アプリケーションまでなら作成できます。

app.rbを実行するとWEBrickがローカル上で起動し、http://localhost:9292/ にアクセスすることでアプリケーションを利用できます。

```.bash
$ ruby app.rb
```

## 使い方
app.rbファイルに以下のようにルーティングを設定することで、それぞれ対応したレスポンスを返します。

```.rb
router.get '/hello' do |params|
  @body = params["word"] || "Hello World"
  render :index
end
```
