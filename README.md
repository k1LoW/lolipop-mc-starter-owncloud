# ロリポップ！マネージドクラウド スターター for ownCloud

https://owncloud.org/

## インストールバージョン

ownCloud v10.0.10

## インストール方法

### 0. 事前準備

1. [ロリポップ！マネージドクラウド](https://mc.lolipop.jp)でアカウントを作成
2. SSH公開鍵の追加と設定済み

### 1. ロリポップ！マネージドクラウドで新規プロジェクトを作成

PHP 7.2.12 ( 例: `lolipop-mc-starter-owncloud.lolipop.io` )

### 2. インストール

``` console
$ make install
```

### 3. ownCloudのセットアップ

プロジェクトURL ( 例: `https://lolipop-mc-starter-owncloud.lolipop.io` ) にアクセスしてownCloudのセットアップを開始します

![img](owncloud-setup.png)

| 値 | 入力内容 |
| --- | --- |
| 管理者アカウント ユーザー名 | ownCloudの管理者アカウントのユーザ名 |
| 管理者アカウント パスワード | ownCloudの管理者アカウントのパスワード |
| データフォルダ | `/var/www/html/data` |
| データベース | MySQL/MariaDB |
| データベースのユーザー名 | PHPプロジェクトのデータベースのユーザ名 |
| データベースのパスワード | PHPプロジェクトのデータベースのパスワード |
| データベース名 | PHPプロジェクトのデータベース名 |
| localhost | PHPプロジェクトのデータベースホスト名とポート (`mysql-1.mc.lolipop.lan:3306`) |

### 4. セットアップ完了

![img](owncloud-complete.png)
