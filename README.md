# Necesseサーバー

- https://necessewiki.com/Multiplayer
- https://necessewiki.com/Multiplayer-Linux

## 依存パッケージ

Docker, Docker buildx(Dockerのバージョンが23以前の場合)

## サーバー起動の手順

### Docker イメージのビルド

`necesse` というタグ名でイメージを作成します。

Dockerのバージョンがが24以降の場合

```
docker build -t necesse .
```

Dockerのバージョンが23以前の場合

```
docker buildx build -t necesse .
```

### Docker コンテナの立ち上げ

#### `create_world.sh`

ワールドの初期設定を行うスクリプトです。

このスクリプトの実行により、下記が行われます。

- ワールド名やサーバー人数、シード値などのサーバーの設定を対話的行います。名付けたサーバー名はひかえておきましょう。
- ホスト側の`./data`ディレクトリにセーブデータが作成されます。`saves`や`cache`フォルダがあることを確認しましょう。

`Type help for list of commands.`というメッセージが来たら、`exit`とタイプし、Enterを押してください。

これでワールドの初期設定は完了です。

#### `run_server.sh`

新しいコンテナでサーバーを立ち上げるためのスクリプトです。

このスクリプトに上記で設定したワールド名を指定して実行してください。これにより、下記が行われます。

- `necesse`という名前でコンテナが作成されます。
- 指定したワールドのサーバーを立ち上げます。
- コンテナは`14159`のポートでUDP通信を受け付けます。
- `./data`にセーブデータなどが更新されるようになります。
- ホストの再起動時などは自動でコンテナが起動されます。

## サーバーの再起動の手順

何かしらの不具合でサーバーを再起動したいときは下記を実行してください。

```
docker restart necesse
```

ワールドを作り直したい場合は、下記「コンテナの停止と削除」を行い、再度上記の「サーバー起動の手順」を行ってください。

#### コンテナの停止と削除

```
docker stop necesse
docker rm necesse
```

## Docker内やってること

1. SteamCMDでNecesseのサーバー設定
    - Steam App ID: `1169370`
2. セーブデータのディレクトリ作成
3. サーバー起動
    - ワールド作成
    - サーバー起動

