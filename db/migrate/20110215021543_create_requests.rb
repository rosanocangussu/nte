class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.references :user
      t.string :title
      t.text :body
      t.string :mode
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
