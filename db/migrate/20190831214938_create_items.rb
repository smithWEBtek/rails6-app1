class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.date :date
      t.text :body
      t.string :url_full_post
      t.string :url_image
      t.string :url_document
      t.string :url_audio
      t.string :url_video
      t.text :tagged_as
      t.text :categorized_under
      t.string :contact
      t.string :contact_first_name
      t.string :contact_last_name
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
