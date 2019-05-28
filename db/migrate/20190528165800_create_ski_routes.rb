class CreateSkiRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :ski_routes do |t|
      t.string :title
      t.text :intro
      t.integer :distance
      t.integer :vert
      t.integer :time
      t.string :aspect
      t.integer :dificulty
      t.text :route_description
      t.string :location
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end