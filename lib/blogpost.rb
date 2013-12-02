require 'open-uri'
require 'nokogiri'

class Blogpost
  attr_accessor :title, :url, :author

  def initialize(title, url, author)
    @title  = title
    @url    = url
    @author = author.split[0..1].join(' ')
  end

  def relative_url
    if url.include? 'helabs.com.br'
      url.gsub('http://helabs.com.br', '')
    else
      url
    end
  end

  def to_yaml
    "title: #{title}\nurl: #{url}\n"
  end

  def self.fetch(url)
    doc = Nokogiri::XML(open(url))
    doc.css('entry').map do |entry|
      Blogpost.new(entry.css('title').text, entry.css('id').text, entry.css('name').text)
    end
  end

  def ==(other)
    self.title  == self.title &&
    self.url    == self.url &&
    self.author == other.author
  end
end