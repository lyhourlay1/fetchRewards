class Spend < ApplicationRecord
    #model validation to ensure that points and user_id is needed in order to save
    validates :points, :user_id, presence:true

    #rails association to connect user and spend
    belongs_to :user, 
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
