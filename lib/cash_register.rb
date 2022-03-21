require 'pry'
class CashRegister
    attr_accessor :discount, :total, :quantity, :items

    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(tittle,price,quantity=1)
        @total += price * quantity
        item = Hash["tittle" => tittle, "price" => price, "quantity" => quantity]
        @items << item
    end
    def apply_discount
        if self.discount != 0
            disc = (self.discount.to_f / 100.0) * self.total
            self.total = self.total - disc.to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end 
    def items
        cart = []
        @items.map do |item|
            items_in_cart = item["tittle"] * item["quantity"]
            cart << items_in_cart
        end 
        cart
    end 


end