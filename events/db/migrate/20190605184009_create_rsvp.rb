class CreateRsvp < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
			t.belongs_to :user
      t.belongs_to :event
    end
  end
end
