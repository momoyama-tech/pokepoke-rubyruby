# pokepoke-rubyruby

## description

Pokémon Trading Card Game Pocketを更に楽しむためのサポートシステム。

### feature

- Rate
- Recipe

## init

```bash
# 初期のbootstrapを導入
rails dartsass:install

# dbの初期設定
rails db:create db:migrate
rails db:seed

# railsサーバーの起動 *開発時
rails s
```

### accounts

|        id       | password |
|-----------------|----------|
| foo@example.com | password |
| bar@example.com | password |
| baz@example.com | password |

### routing

|       path      | description |
|-----------------|-------------|
| / | ダッシュボードページ |
| /dashboard | ダッシュボードページ |
| /session/new | ログインページ |

### model

|    model name   | description |
|-----------------|-------------|
| user | ユーザー |
| rate | レート |
| deck | デッキ |
| deck_recipe | デッキレシピ |
| poke_card | ポケポケカード |
| deck_poke_card | デッキとポケポケカードの中間モデル |
| user_poke_card | ユーザーとポケポケカードの中間モデル<br/>ユーザーの所有しているポケポケカードを管理する |

## commands
| コマンド               | 説明                     |
|------------------------|--------------------------|
| `rails dartsass:install` | 初期のbootstrapを導入     |
| `rails db:create db:migrate` | dbの初期設定             |
| `rails db:seed`        | データベースのシード      |
| `rails db:migrate:reset db:seed`              | データベースを削除して再度作成 |
| `rails s`              | railsサーバーの起動 *開発時 |
