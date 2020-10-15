require 'pry'

def find_item_by_name_in_collection(name, collection)
  collection.each do |k, v|
      k.each do |innerkey, innervalue|
        if innervalue == name
          return k
        end
      end
    end
  nil
end

def consolidate_cart(cart)
  consolidated_cart = {}
    cart.each do |k|
      k.each do |innerkey, innervalue|
        if find_item_by_name_in_collection(innervalue, consolidated_cart) == nil
          consolidated_cart = k.merge({:count => 1})
          #binding.pry
        else innervalue == consolidated_cart[:item]
          consolidated_cart[:count] += 1
        end
      end
    end
  consolidated_cart
end
#end
