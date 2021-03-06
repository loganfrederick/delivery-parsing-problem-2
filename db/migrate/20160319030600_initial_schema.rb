class InitialSchema < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.integer :placement_id
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :cpm
      t.float :budget
    end

    create_table :deliveries do |t|
      t.integer :placement_id
      t.date :date
      t.integer :impressions
    end
  end
end
