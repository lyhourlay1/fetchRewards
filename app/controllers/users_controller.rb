class UsersController < ApplicationController

    def create 
        @user = User.create(user_params)
        if @user.save
            render json: "user saved"
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    def user_params
        params.require(:user).permit(:username)
    end

    def show
        @balance = balance(Transaction.where(user_id: params[:id]))
    end

    def balance(transactions)
        hash=Hash.new(0)
            transactions.each do |transaction|
                hash[transaction.payer]+=transaction.points
            end
        return hash
    end



end
