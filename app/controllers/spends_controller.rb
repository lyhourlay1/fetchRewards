class SpendsController < ApplicationController

    def create 
        @spend = Spend.create(spend_params)
        @spend.user_id = params[:user_id]
        if @spend.save
            makeTransactions(@spend.points, params[:user_id])
            render json: "spend completed"
        else
            render json: @spend.errors.full_messages, status: 401
        end
    end

    def spend_params
        params.require(:spend).permit(:points)
    end

    def makeTransactions(points, user_id)
        transactions = Transaction.where(user_id: user_id)
    end
end
