class CreateReviewers < ActiveRecord::Migration[5.1]
  def change
    create_table :reviewers do |t|
      t.string :name
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
