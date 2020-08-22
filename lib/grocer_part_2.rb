require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupon_item = {}
  coupons.each do |coupon|
    cart.each do |grocery|
      if grocery[:item] === coupon[:item]
        
        #make cupon price per item
        if coupon[:num] > 1 
          new_cost = coupon[:cost] = coupon[:cost]/coupon[:num]
        end
        
        #Set up new discounted item for cart
        coupon_item = {}
        coupon_item[:item] = "#{grocery[:item]} W/COUPON"
        coupon_item[:price] = new_cost
        coupon_item[:clearance] = grocery[:clearance]
        
        if coupon[:num] >= grocery[:count]
          coupon_item[:count] = grocery[:count]
          grocery[:count] = 0
        else
          coupon_item[:count] = coupon[:num]
          grocery[:count] = grocery[:count] - coupon_item[:count]
        end
        cart << coupon_item
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item|
    if item[:clearance]
      item[:price] *= 0.8
      item[:price].round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
