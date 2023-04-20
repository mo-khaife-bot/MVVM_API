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
        print("viewDidLoad")
        
        tableView.dataSource = self
        
        
        
        tableView.separatorStyle = .none
        
        // Do any additional setup after loading the view.
        table_ViewModel.getDataUsingClosures(urlString: urlString)

        table_ViewModel.reloadMyView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        // call the API with CLOSURE
    }
    
    func downLoadImage(from url : URL, completion: @escaping (UIImage?) -> Void) {
        // call the completion handler with the image or nil if there was an error
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
        
//        DispatchQueue.global(qos: .background).async {
//            guard let image = UIImage(data: data) else {
//                completion(nil)
//                return
//            }
//
//            DispatchQueue.main.async {
//                completion(image)
//            }
//        }
        
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table_ViewModel.products_list?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell") as! ProductsTVC
        let allProducts = table_ViewModel.products_list?.products[indexPath.row]
        cell.productsTitleLbl.text = allProducts?.title.capitalized
        cell.productsPriceLbl.text =  "£ \(allProducts?.price ?? 0)"
        
//        downLoadImage(table_ViewModel.products_list?.products) { image in
//            DispatchQueue.main.async {
//                cell.imgProductsThumbnail = image
//            }"
//        }
        let imageUrl = URL(string: allProducts?.thumbnail ?? "nil")!
        downLoadImage(from: imageUrl) { image in
            cell.imgProductsThumbnail.image = image
        }
        
        
        cell.productsView.layer.cornerRadius = cell.productsView.frame.height / 2
        
        return cell
    }
}


