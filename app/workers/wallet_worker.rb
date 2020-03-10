class WalletWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id)
    WalletService.new.create(user_id)
  end
end



