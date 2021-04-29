//
//  FOODViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-29.
//

import UIKit

class FOODViewController: UIViewController{

    
    @IBOutlet weak var tableFood: UITableView!



    var foodItem: [food] = [
        food(_id: "01", foodName: "Tacos", description: "baked beans, grilled chicken and shredded mozzarella cheese", price: 800, discount: 10, image: "Taco"),
        food(_id: "02", foodName: "Bubble tea", description: "Bubble Tea is the name given to the wide variety of refreshing flavoured fruit teas and milk teas served ice cold or piping hot with chewy tapioca balls that you suck up through a big fat straw!", price: 500, discount: 0, image: "bubble tea"),
        food(_id: "03", foodName: "Burger", description: "A burger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.", price: 550, discount: 0, image: "burger"),
        food(_id: "04", foodName: "Garlic Bread", description: "Garlic bread (also called garlic toast) consists of bread (usually a baguette or sour dough like a ciabatta), topped with garlic and olive oil or butter and may include additional herbs, such as oregano or chives. It is then either grilled or broiled until toasted or baked in a conventional or bread oven.", price: 350, discount: 0, image: "garlic bread"),
        food(_id: "05", foodName: "Seafood Pizza", description: "Sprinkle cheeses over sauce. Arrange shrimp, anchovies and scallops on cheeses. Sprinkle basil, pepper and garlic over seafood.", price: 1200, discount: 5, image: "Pizza")
                             
    ]
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableFood.register(UINib(nibName: "FOODTableViewCell", bundle: nil), forCellReuseIdentifier: "foodCellReuseIdentifier")

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
