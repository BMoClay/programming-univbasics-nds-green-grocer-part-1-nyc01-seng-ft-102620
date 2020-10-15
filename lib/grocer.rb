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
  new_cart = []
  counter = 0
  while counter < cart.length
    new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
    if new_cart_item != nil
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[counter][:item],
        :price => cart[counter][:price],
        :clearance => cart[counter][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
    counter += 1
  end
  new_cart
end
