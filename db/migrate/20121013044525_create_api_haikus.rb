class CreateApiHaikus < ActiveRecord::Migration
  def change
    create_table :api_haikus do |t|
      t.string :name

      t.timestamps
    end
  end
end
