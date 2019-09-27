class TransactionsController < ApplicationController

    def index
        @transactions = @user.transactions
    end

end
