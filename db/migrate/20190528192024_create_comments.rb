class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.belongs_to :ski_route, index: true
      t.timestamps
    end
  end
end
