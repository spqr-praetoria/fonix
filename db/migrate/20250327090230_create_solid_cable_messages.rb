class CreateSolidCableMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :solid_cable_messages do |t|
      t.string :channel, null: false
      t.string :broadcasting, null: false
      t.text :message, null: false
      t.timestamps
    end

    add_index :solid_cable_messages, [ :channel, :broadcasting ]
  end
end
