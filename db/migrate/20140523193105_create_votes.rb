class CreateVotes < ActiveRecord::Migration
  def change
    create_table   :votes do |t|
      t.references :image
      t.uuid       :session_id
      t.integer    :smallint, :value
      t.timestamps
    end
  end
end
