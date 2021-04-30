//
//  foodDetailsViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import UIKit
import Kingfisher
import Loaf

class foodDetailsViewController: UIViewController {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    @IBOutlet weak var lblFoodPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    
    var foodDetails: food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item  = self.foodDetails {
            imgFood.kf.setImage(with: URL(string: item.image))
            lblFoodName.text = item.foodName
            lblFoodDescription.text = item.description
            lblFoodPrice.text = "LKR-\(item.price)"
            lblDiscount.text = "\(item.discount)% OFF"
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnAddToCart(_ sender: UIButton) {
        if let item = self.foodDetails {
            cartHandler.foodItems.append(item)
        }
        
        print(cartHandler.foodItems)
        Loaf("Item added to the cart successfully", state: .success, sender: self).show()

    }
}
