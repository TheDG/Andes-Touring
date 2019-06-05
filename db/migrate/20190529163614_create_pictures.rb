class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.text :description
      t.belongs_to :ski_route, index: true
      t.timestamps
    end
  end
end
