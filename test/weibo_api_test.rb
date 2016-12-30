require 'test_helper'


class WeiboApiTest < Minitest::Test
  
  def setup 
  	token = ENV["WEIBO_TOKEN"]
  	key = ENV["WEIBO_KEY"]
  	secret = ENV["WEIBO_SECRET"]
  	@weibo_api = WeiboApi::Client.new(token: token, weibo_key: key, weibo_secret: secret)
  end

  def test_that_it_has_a_version_number
    refute_nil ::WeiboApi::VERSION
  end

  def test_get_tweets
  	res = @weibo_api.statuses.home_timeline.get(params: {count: 100})
  	# ap res.statuses.map(&:text)
  	# ap res.statuses.map{|s|s.user.screen_name}
    assert res.statuses.is_a?(Array)
    assert res.statuses.size == 100
  end

  def test_it_does_something_useful
    assert @weibo_api
  end

end
