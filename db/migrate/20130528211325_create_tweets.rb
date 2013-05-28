class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :body
      t.datetime :post_at

      t.timestamps
    end
  end
end
