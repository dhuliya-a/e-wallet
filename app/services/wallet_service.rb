class WalletService

  def create(user_id)
    raise ValidationError.new, "Wallets weren't created" if Wallet.create!(user_id: user_id, current_balance: 100, currency: 'dollars').blank?
  end

  def external_transfer(sender, receiver_id, amount)
    raise ValidationError.new, "Amount Invalid" if amount.blank? || amount.to_d <= 0

    raise ValidationError.new, "Insufficient Balance" if sender.wallets.first.current_balance < amount.to_d

    raise ValidationError.new, "Receiver doesn't exist" if User.find_by(id: receiver_id).blank?

    Wallet.transaction do
      a=sender.wallets.first.current_balance.to_f - amount.to_f
      b=u.wallets.first.current_balance.to_f + amount.to_f

      sender.wallets.first.update(current_balance: a)
      u.wallets.first.update(current_balance: b)
    end
  end

  def internal_transfer(base_wallet, target_wallet, amount)
    #needs to make a call to another service which keeps track of the exchange rates.
  end
end
