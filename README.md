# my_framework
## 概要
フレームワークへの理解を深めるため、Sinatra風のフレームワークを自作した際のリポジトリです。

現在はクエリ文字列を含むGETリクエストに対応しており、簡単なWebアプリケーションなら作成できます。

app.rbを実行するとWEBrickがローカル上で起動し、http://localhost:9292/ にアクセスすることでアプリケーションを利用できます。

```.bash
$ ruby app.rb
```

## 使い方
app.rbファイルに以下のようにルーティングを設定することで、対応したビューファイルを返します。
基本的にはSinatraと同じ使い方です。

```.rb
router.get '/hello' do |params|
  @body = params["word"] || "Hello World"
  render :index
end
```