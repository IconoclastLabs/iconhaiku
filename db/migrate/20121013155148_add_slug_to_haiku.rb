class AddSlugToHaiku < ActiveRecord::Migration
  def change
    add_column :api_haikus, :slug, :string
    add_index :api_haikus, :slug, unique: true
  end
end
