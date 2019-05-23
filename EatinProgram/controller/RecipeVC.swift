//
//  RecipeVC.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 03/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class RecipeVC : UICollectionViewController
{
    var selectedCategory : String!
    var recipes : [Recipe]!
    var data = DataSet()
    var recipeToPass : Recipe!
    
    override func viewDidLoad() {
        collectionView.backgroundColor = .white
        collectionView.register(recipeCell.self, forCellWithReuseIdentifier: "recipeId")
        recipes = data.getRecipes(forCategoryTitle: selectedCategory!)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeId", for: indexPath) as? recipeCell {
            let recipe = recipes[indexPath.item]
            cell.recipe = recipe
            return cell
        }
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.item]
        let recipeDVC = RecipeDetailedVC()
        recipeDVC.selectedRecipe = recipe
        navigationController?.pushViewController(recipeDVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let cellDimension = ( width / 2 ) - 15
//        print(cellDimension)
        return CGSize(width : cellDimension, height : cellDimension)
    }
}
