class AddArroganceSwagCounts < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.remove :vote_count
      t.integer    :vote_swag_count, limit: 8, default: 0
      t.integer    :vote_arrogance_count, limit: 8, default: 0
    end

    Image.update_all(vote_arrogance: 0, vote_swag: 0)
  end
end
