class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :nome
      t.string :url
      t.integer :view_counter

      t.timestamps
    end
  end
end
