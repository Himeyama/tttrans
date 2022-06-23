# TTTrans
この Gem は「みんなの自動翻訳＠TexTra®」に対し WebAPI を叩き、翻訳するアプリです。

![image](https://user-images.githubusercontent.com/39254183/175293482-2e432b0b-f52e-457c-bad1-e6e68d627fe1.png)

|機能|開発状況|
|:--:|:--:|
|英日翻訳|✅|
|日英翻訳||
|設定ファイルの読み込み||
|非対話モードによる翻訳||

## インストール
アプリケーションのGemfileに次の行を追加します:

```ruby
gem 'tttrans'
```

次のコマンドを実行します:

    $ bundle install

または、次のようにインストールします:

    $ gem install tttrans

### 環境変数設定
環境変数を設定する必要があるため、`~/.bashrc` などに環境変数を以下のように設定してください。

```bash
export TexTra_URI_EN_JA=https://mt-auto-minhon-mlt.ucri.jgn-x.jp/api/mt/generalNT_en_ja/
export TexTra_ID=【TexTra に登録した ID】
export TexTra_API_KEY=【API key】
export TexTra_API_SECRET=【API secret】
```

詳しくは、https://www.hikari-dev.com/2022/06/22/TexTra-ruby/ を参照してください。

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

`:q` で対話を終了します。

## 開発について

リポジトリをチェックアウトした後、`bin/setup` を実行して依存関係をインストールします。
また、`bin/console` を実行してインタラクティブなプロンプトを表示し、実験を行うこともできます。

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

このgemをローカルマシンにインストールするには、`bundle exec rake install` を実行します。新しいバージョンをリリースするには、`version.rb` のバージョン番号を更新してから `bundle exec rake release` を実行します。
これによりそのバージョンの git タグが作成され、git コミットと作成されたタグがプッシュされ、
`.gem` ファイルが [rubygems.org](https://rubygems.org) に プッシュされます。

## ソフトウェアライセンス

この Gem は、[MITライセンス](https://opensource.org/licenses/MIT) の条件の下でオープンソースとして利用できます。
