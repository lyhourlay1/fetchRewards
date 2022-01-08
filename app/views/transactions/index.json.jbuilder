@transactions.each_with_index do |transaction, index|
   json.set! transaction.id do
     json.extract! transaction, :payer, :points
   end
end