class AddRetweetByToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :retweet_by, :integer
  end
end
