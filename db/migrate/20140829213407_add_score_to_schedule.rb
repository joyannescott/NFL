class AddScoreToSchedule < ActiveRecord::Migration
  def change
  	add_column :schedules, :value, :integer
  end
end
