class RemoveRetweetFromMicroposts < ActiveRecord::Migration
  def change
    remove_column :microposts, :retweet, :string
  end
end
