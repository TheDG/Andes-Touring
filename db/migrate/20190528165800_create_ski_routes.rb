class CreateSkiRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :ski_routes do |t|
      t.string :title
      t.text :intro
      t.decimal :distance
      t.integer :vert
      t.decimal :time
      t.string :aspect
      t.integer :dificulty
      t.text :route_description
      t.string :location
      t.string :sector
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
