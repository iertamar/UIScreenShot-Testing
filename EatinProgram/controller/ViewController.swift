//
//  ViewController.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 03/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let data = DataSet()
    var categoryToPass : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(categoryCell.self, forCellReuseIdentifier: "categoryId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryId", for: indexPath) as? categoryCell
        {
            let foodCategory = data.categories[indexPath.row]
            cell.foodCategory = foodCategory
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 200
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let flowLayout = UICollectionViewFlowLayout()
        let width = view.frame.width
        let cellDimension = ( width / 2 ) - 10
        flowLayout.itemSize =  CGSize(width : cellDimension, height : cellDimension)
        categoryToPass = data.categories[indexPath.row].title
        let recipeVC = RecipeVC(collectionViewLayout: flowLayout)
        recipeVC.selectedCategory = categoryToPass
        navigationController?.pushViewController(recipeVC, animated: true)
    }
}
