//
//  orderTableViewCell.swift
//  cafeNIBM_FINAL
//
//  Created by Heshani Chamalka on 2021-04-30.
//

import UIKit

class orderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpUI(order: Order){
        lblOrderId.text = order.orderID
        lblStatus.text = order.orderStatus
        lblTotal.text = "LKR \(order.orderTotal)"
        
    }
    
}
