

class CashRegister#==================================

    @@all_total = []
    @@all_item = []
    attr_accessor \
        :discount,
        :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @@all_total = [@total] 
        @@all_item = []
    end

    def add_item(title,price,quantity = 1)
        quantity.times do
            @@all_item << title
        end
        @total = @total + (quantity * price)
        @@all_total << @total
    end

    def apply_discount
        total_f = @total.to_f 
        discount_f = @discount.to_f
        new_total_f = total_f * ((100.0 - discount_f)/100.0)
        @total = new_total_f.to_i
        @@all_total << @total
        if @discount != 0
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @@all_item
    end

    def void_last_transaction
        @@all_total.pop
        @@all_item.pop
        @total = @@all_total[@@all_total.length - 1]        
    end
    



end#=================================================