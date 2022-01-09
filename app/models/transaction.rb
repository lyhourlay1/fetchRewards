class Transaction < ApplicationRecord

    #model validation prior saving to the database
    validates :points, :payer ,presence:true
    validates :redeemed, inclusion: {in: [true, false]}

    #rails assocation to connect transactions and user
    belongs_to :user, 
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
