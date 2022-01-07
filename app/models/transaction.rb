class Transaction < ApplicationRecord
    validates :points, :payer, :presence:true

end
