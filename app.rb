require 'sinatra'
require 'net/http'
require 'uri'

KINDLE_EMAIL_DOMAINS = {
  'free.kindle.com' => 1,
  'kindle.com'      => 2,
}
TRIGGER_COMMENT = 'via ifttt'

get '/' do 
  redirect 'http://github.com/kyanny/send-to-kindle-it-via-hatena-bookmark-web-hook'
end

post '/kindleit/' do 
  unless ENV['HATENA_BOOKMARK_WEBHOOK_KEY']
    logger.info('HATENA_BOOKMARK_WEBHOOK_KEY not set.')
  end
  
  unless ENV['HATENA_BOOKMARK_WEBHOOK_KEY'] == params['key']
    logger.info('HATENA_BOOKMARK_WEBHOOK_KEY not match.')
    return
  end
  
  unless params['comment'].match(/#{TRIGGER_COMMENT}/)
    logger.info('comment not match.')
    return
  end
  
  unless kindle_email_local_part = ENV['KINDLE_EMAIL_LOCAL_PART']
    logger.info('KINDLE_EMAIL_LOCAL_PART not set.')
    return
  end
  
  unless kindle_email_domain_type = KINDLE_EMAIL_DOMAINS[ENV['KINDLE_EMAIL_DOMAIN']]
    logger.info('KINDLE_EMAIL_DOMAIN not set.')
    return
  end
  
  uri = URI("http://fivefilters.org/kindle-it/send.php?context=send&url=#{params['url']}&email=#{kindle_email_local_part}&domain=#{kindle_email_domain_type}")
  logger.info("GET #{uri.to_s}")
  logger.info(Net::HTTP.get(uri))
end
