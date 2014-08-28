class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week
      t.integer :game
      t.string :team0
      t.string :team1
      t.integer :winner

      t.timestamps
    end
  end
end
