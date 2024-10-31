class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      has_many :posts, dependent: :destroy

      t.timestamps
    end
  end
end
