class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :reviewer, class_name: "User", foreign_key: :reviewer_id
end
