//
//  cartHandler.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import Foundation
class cartHandler {
    
    static var foodItems: [food] = []
 
    static func getCartItems() ->[food] {
        return foodItems
    }
    static func clearCart() {
        self.foodItems.removeAll()
    }
}
