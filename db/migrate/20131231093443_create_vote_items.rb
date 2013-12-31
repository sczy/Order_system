class CreateVoteItems < ActiveRecord::Migration
  def change
    create_table :vote_items do |t|
      t.integer :food_id
      t.integer :user_id

      t.timestamps
    end
  end
end
