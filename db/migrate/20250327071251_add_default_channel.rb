class AddDefaultChannel < ActiveRecord::Migration[8.0]
  def up
    Channel.create!(name: "General", description: "General discussions") if Channel.count.zero?
  end

  def down
    Channel.find_by(name: "General")&.destroy
  end
end
