class TransactionsController < ApplicationController

    def create 
        @transaction = Transaction.create(transaction_params)
        @transaction.user_id = params[:user_id]
        if @transaction.save
            render json: "transaction saved"
        else
            render json: @transaction.errors.full_messages, status: 401
        end
    end

    def index
        # debugger
        @transactions = Transaction.where(user_id: params[:user_id])
        
    end

    def transaction_params
        params.require(:transaction).permit(:payer, :points)
    end
end
