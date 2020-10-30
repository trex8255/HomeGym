module ApplicationHelper
    def item_to_currency(object)
        number_to_currency(object.quantity*object.pack.price, precision: 0)
        
    end

    def cart_to_currency (object)
        number_to_currency(object.pack.price * object.quantity, precision: 0)
    end
end
