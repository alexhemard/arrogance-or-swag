class AddVotesToImage < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.integer :vote_arrogance, limit: 8, default: 0
      t.integer :vote_swag,      limit: 8, default: 0
      t.integer :vote_count,     limit: 8, default: 0
    end
  end
end
