//
//  ProductsTVC.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import UIKit

class ProductsTVC: UITableViewCell {
    
    @IBOutlet weak var productsView: UIView!
    
    
    @IBOutlet weak var productsLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
