class CreateRetweetRelationships < ActiveRecord::Migration
  def change
    create_table :retweet_relationships do |t|
      t.references :post_id, index: true
      t.references :retweeter_id, index: true

      t.timestamps null: false
    end
  end
end
