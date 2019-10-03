class TransactionsController < ApplicationController

    def create
        @transaction = Transaction.create(transaction_params)
        @cereal = Cereal.find(params[:transaction][:cereal_id])
        @cereal.taken_amount(@transaction.amount)
        @user = User.find(@transaction.user_id)
        @user.subtract_total(@transaction.amount)
        redirect_to cereal_path(@cereal)
    end

    private
    def transaction_params
        params.require(:transaction).permit(:amount, :user_id, :cereal_id)
    end
end
