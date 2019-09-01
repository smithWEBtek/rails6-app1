class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.date :date
      t.text :body
      t.string :image_url
      t.string :url
      t.text :tagged_as
      t.text :categorized_under
      t.string :contact_name
      t.string :contact_title
      t.string :contact_phone
      t.string :contact_email
      t.string :author_name
      t.string :author_url
      t.datetime :posted_date_time
      t.timestamps
    end

  end
end
