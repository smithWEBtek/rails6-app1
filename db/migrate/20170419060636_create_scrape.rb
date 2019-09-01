class CreateScrape < ActiveRecord::Migration[5.0]
  def change
    create_table :scrapes do |t|
      t.string :name
    end
  end
end
