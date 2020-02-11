class AddIndexUsernameInReviewers < ActiveRecord::Migration[5.1]
  def change
    add_index :reviewers, :username
  end
end
