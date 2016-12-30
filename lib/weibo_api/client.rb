require 'oauth2'

module WeiboApi
	class Client < ::Hashie::Trash
		
		property :token
		property :weibo_key
		property :weibo_secret

		def initialize(attributes = {}, &block)
			super
			client = OAuth2::Client.new(weibo_key, weibo_secret, site: "https://api.weibo.com/2")
			@request_token = OAuth2::AccessToken.new(client, token, {mode: :query})
			@method_caches = []
		end

		private

		def path
			@method_caches.join("/") + ".json"
		end

		def request(args, request = :get)
			ap args
			response = @request_token.method(request).call(path, args || {})
			Hashie::Mash.new MultiJson.decode(response.body)
		end
		
		def method_missing(name, *args)
			[:get, :post].include?(name) ? request(args.first, name) : (@method_caches << name) && self
		end

	end
end