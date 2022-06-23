# TTTrans
[![Ruby](https://github.com/Himeyama/tttrans/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/Himeyama/tttrans/actions/workflows/main.yml)
[![Gem Version](https://badge.fury.io/rb/TTTrans.svg)](https://badge.fury.io/rb/TTTrans)

この Gem は「みんなの自動翻訳＠TexTra®」に対し WebAPI を叩き、翻訳するアプリです。

![image](https://user-images.githubusercontent.com/39254183/175293482-2e432b0b-f52e-457c-bad1-e6e68d627fe1.png)

|機能|開発状況|
|:--:|:--:|
|英日翻訳|✅|
|日英翻訳|✅|
|設定ファイルの読み込み|✅|
|非対話モードによる翻訳||

## インストール
次のようにインストールします:

    $ gem install TTTrans

アプリケーションの Gemfile に次の行を追加します (アプリケーションに追加しない場合は無視してください):

```ruby
gem 'TTTrans'
```

次のコマンドを実行します (アプリケーションに追加しない場合は無視してください):

    $ bundle install

### ログイン設定
API を利用するにはユーザー ID や API キーなどを設定する必要があるため、
`~/.tttconfig` に以下のように設定を書き込んでください。

```ini
[textra]
id=【TexTra に登録したユーザー ID】
api_key=【API key】
api_secret=【API secret】
```

## 使用方法

`gem install` によってインストールを行った場合は、以下のコマンドで対話型翻訳を実行できます。

```bash
$ ttt
```

プロジェクトがカレントディレクトリになっている場合は、以下のコマンドで対話型翻訳を実行できます。

```bash
$ bundle # 1 回だけ
$ bundle exec ttt
```

`:en2ja` で 英日翻訳モード、`:ja2en` で日英翻訳モードを切り替え可能です。

`:q` または、`Ctrl` + `C` で対話を終了します。

## 開発について

リポジトリをチェックアウトした後、`bin/setup` を実行して依存関係をインストールします。
また、`bin/console` を実行してインタラクティブなプロンプトを表示し、実験を行うこともできます。

このgemをローカルマシンにインストールするには、`bundle exec rake install` を実行します。新しいバージョンをリリースするには、`version.rb` のバージョン番号を更新してから `bundle exec rake release` を実行します。
これによりそのバージョンの git タグが作成され、git コミットと作成されたタグがプッシュされ、
`.gem` ファイルが [rubygems.org](https://rubygems.org) に プッシュされます。

## ソフトウェアライセンス

この Gem は、[MITライセンス](https://opensource.org/licenses/MIT) の条件の下でオープンソースとして利用できます。
