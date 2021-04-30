//
//  FOODViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-29.
//

import UIKit
import Firebase
import SwiftyJSON

class FOODViewController: UIViewController{
    var ref: DatabaseReference!


    
    @IBOutlet weak var tableFood: UITableView!



    var foodItem: [food] = []
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        tableFood.register(UINib(nibName: "FOODTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCellReuseIdentifier")
            getFoodItemsData()
    }
  
    
}
extension FOODViewController{
    func getFoodItemsData(){
        ref.child("Food Items").observe(.value, with: {
            (snapshot) in
            if let data = snapshot.value {
                if let foodItems = data as? [String: Any] {
                    for item in foodItems{
                        if let foodInfo = item.value as? [String: Any] {
                            
                            let singleFoodItem = food(
                                _id: "",
                                foodName: foodInfo["name"] as! String,
                                description: foodInfo["description"] as! String,
                                price: foodInfo["price"] as! Double,
                                discount: foodInfo["discount"] as! Int,
                                image: foodInfo["image"] as! String,
                                category: foodInfo["category"] as! String)
                            
                            self.foodItem.append(singleFoodItem)

                        }
                    }
                    self.tableFood.reloadData()

                }

            }
        })
        
    }
}


extension FOODViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableFood.dequeueReusableCell(withIdentifier: "foodCellReuseIdentifier", for: indexPath) as! FOODTableViewCell
        cell.setUpView(foodItem: foodItem[indexPath.row])
        return cell
        
    }
    
    
}
