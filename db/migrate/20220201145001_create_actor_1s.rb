class CreateActor1s < ActiveRecord::Migration[7.0]
  def change
    create_table :actor_1s do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
