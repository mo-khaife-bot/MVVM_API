//
//  ViewController.swift
//  MVVM_API
//
//  Created by mohomed Ali on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://dummyjson.com/products"
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let table_ViewModel = TableViewModel(networkManager: NetworkManager())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table_ViewModel.getDataUsingClosures(urlString: urlString)

        table_ViewModel.reloadMyView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // call the API with CLOSURE
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table_ViewModel.products_list?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell") as! ProductsTVC
        
        return cell
    }
}

