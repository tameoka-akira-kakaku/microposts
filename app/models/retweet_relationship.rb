class RetweetRelationship < ActiveRecord::Base
  belongs_to :post_id, class_name: "Micropost"
  belongs_to :retweeter_id, class_name: "User"
end
