class User < ApplicationRecord
    validates :username, uniquenes:true, :presence:true
end
