//
//  orderViewController.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import UIKit
import Firebase
import Loaf

class orderViewController: UIViewController {
    
    @IBOutlet weak var tblOrders: UITableView!

    var orders: [Order] = []
    var ref: DatabaseReference!
    let sessionManager = SessionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        tblOrders.register(UINib(nibName: "orderTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderCellReuseIdentifier")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        getAllOrders()
    }
}
extension orderViewController{
    
    func getAllOrders() {
        self.orders.removeAll()
//        var placedOrders: [Order] = []
        self.ref.child("orders").child(sessionManager.getUserData().email.replacingOccurrences(of: "@", with: "_")
            .replacingOccurrences(of: ".", with: "_"))
            .observe(.value, with: {
                snapshot in
                if let data = snapshot.value{
                    if let orders = data as? [String: Any] {
                        for singleOrder in orders {
                            var placedOrder = Order()
                            placedOrder.orderID = singleOrder.key
                            if let orderInfo = singleOrder.value as? [String: Any] {
                                placedOrder.orderStatus = orderInfo["status"] as! String
                                if let orderItems = orderInfo["orderItems"] as? [Any] {
                                    for item in orderItems {
                                       if let itemInfo = item as? [String: Any] {
                                        placedOrder.orderTotal+=itemInfo["price"] as! Double
                                        }
                                    }
                                 }
                            }
                            self.orders.append(placedOrder)
                        }
                        self.tblOrders.reloadData()
                    }
                }
            })
    }
}

extension orderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblOrders.dequeueReusableCell(withIdentifier: "OrderCellReuseIdentifier", for: indexPath) as! orderTableViewCell
        cell.setUpUI(order: orders[indexPath.row])
        return cell
    }
}

