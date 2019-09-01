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
        url_full_post: d.css('a.fl-post-grid-more').attr('href')
      )
      if i.save && i.url_full_post
        self.get_full_post(i)
      end
    end
  end

  def self.get_full_post(i)
    doc2 = Nokogiri::HTML(open(i.url_full_post))
    data2 = doc2.css('article')

    data2.each do |d|
      i.update(
        body: d.css('.fl-module.fl-module-rich-text')[1].text.gsub(/\t|\n/, ''),
        categorized_under: d.css('.post-meta p a').map {|t| t.attributes['rel'].value == 'category tag' ? t.text.gsub(/\\"/, '').split(',') : nil }.compact.flatten,
        tagged_as: d.css('.post-meta p a').map {|t| t.attributes['rel'].value == 'tag' ? t.text.gsub(/\\"/, '').split(',') : nil }.compact.flatten,
        contact: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(2),
        contact_first_name: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(2).split()[0],
        contact_last_name: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(2).split()[1],
        contact_title: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(3),
        contact_phone: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(4),
        contact_email: d.css('.fl-module-content.fl-node-content')[4].children[1].text.split(/\t|\n/).slice(5),
        author_name: d.css('.byline.author a').children[0].text,
        author_url: d.css('.byline.author a').attr('href').value,
        posted_date_time: d.css('time.updated').attr('datetime').value
        )
        puts '*'
    end
  end
end
