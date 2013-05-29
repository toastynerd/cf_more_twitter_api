require 'twitter'

class SendToTwitter
  @queue = :my_twitter_queue
  def self.perform(tweet_id, user_id)
    puts "Sending to twitter"
    tweet = Tweet.find(tweet_id)
    user = User.find(user_id)
    user.twitter.update(tweet.body)
    puts "Sent tweet for #{tweet.post_at} at #{Time.now} to account #{user.name}"
  end
end

