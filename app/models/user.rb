class User < ApplicationRecord
    validates :username, uniqueness:true, presence:true
    has_many :transactions,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Transaction
    
    
    has_many :spends,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Spend
end
