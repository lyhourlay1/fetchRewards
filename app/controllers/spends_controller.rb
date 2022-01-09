class SpendsController < ApplicationController
    #post request to create a spend http call which will also make Transactions if spend is saved
    def create 
        @spend = Spend.create(spend_params)
        @spend.user_id = params[:user_id]
        if @spend.save
            makeTransactions(@spend.points, params[:user_id])
        else
            render json: @spend.errors.full_messages, status: 401
        end
    end

    #spend_params permit the param when making http request
    def spend_params
        params.require(:spend).permit(:points)
    end

    def makeTransactions(points, user_id)
        transactions = Transaction.where(user_id: user_id, redeemed: false).order(timestamp: :ASC)
        i=0
        hashTransactions=Hash.new(0)
        while(points > 0)
            pointsToRemove = transactions[i].remainder || transactions[i].points 
                if (pointsToRemove <= points)
                    hashTransactions[transactions[i].payer]+= pointsToRemove
                    
                    points -= pointsToRemove
                    transactions[i].update(:redeemed=> true)
                else 
                    hashTransactions[transactions[i].payer]+= points
                    transactions[i].update(:remainder => pointsToRemove - points)
                    points = 0
                end
            i+=1;
        end
        hashTransactions.each do |key, value|
            @transaction = Transaction.create(:points => (-1*value), :user_id=> user_id, :payer=>key, :redeemed=> true)
            if @transaction.save
            else
                render json: @transaction.errors.full_messages, status: 401
            end
        end
        render json: "transaction completed"
    end
end
