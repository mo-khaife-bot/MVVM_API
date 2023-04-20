//
//  ProductsTVC.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import UIKit

class ProductsTVC: UITableViewCell {
    
    @IBOutlet weak var productsView: UIView!
    
    
    @IBOutlet weak var productsTitleLbl: UILabel!
    
    @IBOutlet weak var productsPriceLbl: UILabel!
    
    @IBOutlet weak var imgProductsThumbnail: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
