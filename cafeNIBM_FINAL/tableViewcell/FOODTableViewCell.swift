//
//  FOODTableViewCell.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-29.
//

import UIKit
import Kingfisher

class FOODTableViewCell: UITableViewCell {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDiscount: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func setUpView(foodItem: food){
        foodName.text = foodItem.foodName
        foodDescription.text = foodItem.description
        foodPrice.text = "LKR \(foodItem.price)"
        foodImage.kf.setImage(with: URL(string: foodItem.image))
        
        if foodItem.discount > 0 {
            foodDiscount.isHidden = false
            foodDiscount.text = "\(foodItem.discount)% Off"
            
        } else {
            foodDiscount.isHidden = true
            foodDiscount.text = ""
        }
    }
    
}
