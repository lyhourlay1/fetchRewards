class TransactionsController < ApplicationController
    #post request to create a transaction http call
    def create 
        @transaction = Transaction.create(transaction_params)
        @transaction.user_id = params[:user_id]
        if @transaction.save
            render json: "transaction saved"
        else
            render json: @transaction.errors.full_messages, status: 401
        end
    end

    #get reqeust to list all the transactions 
    def index
        @transactions = Transaction.where(user_id: params[:user_id])
    end

    #transaction_params permit the param when making http request
    def transaction_params
        params.require(:transaction).permit(:payer, :points, :timestamp, :redeemed, :remainder)
    end

end