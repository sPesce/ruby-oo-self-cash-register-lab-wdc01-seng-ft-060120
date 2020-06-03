

class CashRegister#==================================
    #--------------------------------------------
    #these two class vars store the cumulative total and list of items
    @@all_total = []
    @@all_item = []
    attr_accessor \
        :discount,
        :total
    #---------------------------------------------   
    #default discount of zero, initialize total, all_total, all_item
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @@all_total = [@total] 
        @@all_item = []
    end
    #---------------------------------------------
    #adds item to cart and updates total
    def add_item(title,price,quantity = 1)
        quantity.times do
            @@all_item << title
        end
        @total = @total + (quantity * price)
        @@all_total << @total
    end
    #changes price according to discount
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
    #list of all items in cart
    def items
        @@all_item
    end
    #remove last item added, reflects total
    def void_last_transaction
        @@all_total.pop
        @@all_item.pop
        @total = @@all_total[@@all_total.length - 1]        
    end
    



end#=================================================