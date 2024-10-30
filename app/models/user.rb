class User < ApplicationRecord
  # パスワードの暗号化と認証機能を追加
  has_secure_password

  # 名前のバリデーション
  validates :name,
    presence: true,     # 必須
    length: { maximum: 50 }  # 最大50文字

  # メールアドレスのバリデーション
  validates :email,
    presence: true,     # 必須
    uniqueness: true,   # 重複不可
    format: {
      with: URI::MailTo::EMAIL_REGEXP  # メールアドレスの形式チェック
    },
    length: { maximum: 255 }  # 最大255文字

  # パスワードのバリデーション
  validates :password,
    length: { minimum: 6 },  # 最小6文字
    allow_nil: true    # パスワード更新時、空欄OKに
end
