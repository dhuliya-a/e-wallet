task notification: :environment do
  # Rails.logger.info("Get cashback on using WalletApp.")
  p "NOTIFICATION."
  REDIS.incr("value")
end
