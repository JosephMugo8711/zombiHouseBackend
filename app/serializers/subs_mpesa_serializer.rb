class SubsMpesaSerializer < ActiveModel::Serializer
  attributes :id, :phoneNumber, :amount, :checkoutRequestID, :merchantRequestID, :mpesaReceiptNumber
end
