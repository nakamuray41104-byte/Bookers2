# README
# Bookers2

DMM WEBCAMP課題: 読書記録アプリケーション

## 機能
- ユーザー認証(Devise)
- 投稿機能(CRUD)
- プロフィール編集
- レスポンシブデザイン

## 技術スタック
- Ruby on Rails 6.1
- SQLite3
- Bootstrap 5
- RSpec (テスト201個すべて通過)

## セットアップ
```bash
bundle install
yarn install
rails db:migrate
NODE_OPTIONS=--openssl-legacy-provider rails server