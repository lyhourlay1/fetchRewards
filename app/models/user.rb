class User < ApplicationRecord
    #model validatio to ensure no duplicated user and username field is required
    validates :username, uniqueness:true, presence:true

    #rails associaions
    has_many :transactions,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Transaction
    
    
    has_many :spends,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Spend
end
