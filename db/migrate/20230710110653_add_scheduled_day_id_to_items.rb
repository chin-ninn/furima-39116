class AddScheduledDayIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :scheduled_day_id, :integer
  end
end
