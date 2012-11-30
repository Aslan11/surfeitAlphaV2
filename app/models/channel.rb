class Channel < ActiveRecord::Base

	belongs_to :user




def self.get_feeds
    feed_urls = ["http://enjoythisorganiclife.wordpress.com/feed"]
    update_from_feeds(feed_urls)
  end

def self.update_from_feeds(feed_urls)
  feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
  feeds.each do |feed_url, feed|
    add_entries(feed.entries)
  end
end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          :title        => entry.title
        )
      end
    end
  end
end