class UsersController < ApplicationController
    #post request to create a user 
        @user = User.create(user_params)
        if @user.save
            render json: "user saved"
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    #user_params permit the param when making http request
    def user_params
        params.require(:user).permit(:username)
    end

    #Get http request that show the balance of the user
    def show
        @balance = balance(Transaction.where(user_id: params[:id]))
    end

    #balance method that combine the transaction that has the same payer and seperate those 
    #that are different
    def balance(transactions)
        hash=Hash.new(0)
            transactions.each do |transaction|
                hash[transaction.payer]+=transaction.points
            end
        return hash
    end



end
