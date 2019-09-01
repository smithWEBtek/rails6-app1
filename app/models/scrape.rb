require 'nokogiri'
require 'open-uri'

class Scrape < ApplicationRecord

  def self.call
    results = []
    doc1 = Nokogiri::HTML(open("https://www.mapc.org/press-room/"))
    data1 = doc1.css('div.fl-post-grid-text')

    data1.each do |d|
      i = Item.new(
        title: d.css('h2 a').text,
        date: d.css('.fl-post-grid-date').text,
        body: d.css('.fl-post-grid-content p').text,
        url: d.css('a.fl-post-grid-more').attr('href')
      )
      if i.save
        self.get_full_data(i)
      end
    end
  end

  def self.get_full_data(i)
    doc2 = Nokogiri::HTML(open(i.url))
    data2 = doc2.css('article')

    data2.each do |d|
      i.update(
        categorized_under: d.css('.post-meta p a').map {|t| t.attributes['rel'].value == 'category tag' ? t.text.gsub('\\', '') : nil }.compact,
        tagged_as: d.css('.post-meta p a').map {|t| t.attributes['rel'].value == 'tag' ? t.text.gsub('\\', '') : nil }.compact,


        d.css('.fl-module-content.fl-node-content')[4].children[1].text

        # "\n\tAmanda Linehan\nCommunications Director, MAPC\n617-933-0705\nalinehan@mapc.org\n"

        # contact_name:
        # contact_title:
        # contact_phone:
        # contact_email:
        author_name: d.css('.byline.author a').children[0].text,
        author_url: d.css('.byline.author a').attr('href').value,
        posted_date_time: d.css('time.updated').attr('datetime').value
        # image_url:
        )

                    # t.string :title
                    # t.date :date
                    # t.text :body
        # t.string :image_url
                    # t.string :url
                    # t.text :tagged_as
                    # t.text :categorized_under
        # t.string :contact_name
        # t.string :contact_title
        # t.string :contact_phone
        # t.string :contact_email
                    # t.string :author_name
                    # t.string :author_url
                    # t.datetime :posted_date_time

        binding.pry
    end
  end
end
