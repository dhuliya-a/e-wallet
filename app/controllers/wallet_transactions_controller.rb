class WalletTransactionsController < ApplicationController
  def send_money
    sender_id = transaction_params[:sender_id]
    receiver_id = transaction_params[:receiver_id]
    amount= transaction_params[:amount]

    raise ValidationError.new, "Unauthorized" if sender_id != current_user.id.to_s

    WalletService.new.external_transfer(User.find(sender_id), receiver_id, amount)
  end

  private

  def transaction_params
    params.permit(:sender_id, :receiver_id, :amount)
  end
end
