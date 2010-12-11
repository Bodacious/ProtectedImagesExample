class CreateUserImages < ActiveRecord::Migration
  def self.up
    create_table :user_images do |t|
      t.string :name
      # uniq => true is important here!
      t.string :image_file_name, :null => false, :uniq => true
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :user_images
  end
end
