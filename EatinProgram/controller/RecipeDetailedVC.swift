//
//  RecipeDetailedVC.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 04/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class RecipeDetailedVC: UIViewController {

    var selectedRecipe : Recipe!
    let imageView : UIImageView = {
        let image = UIImage(named: "leaf_third")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var titleText : UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.boldSystemFont(ofSize: 25)
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.isEditable = false
        return textView
    }()
    
    var instructionText : UITextView = {
        let textView = UITextView()
        //textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.maximumNumberOfLines = 0
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textColor = .gray
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("selected  ",selectedRecipe.imageName)
        setUpLayout()
    }
    
    func setUpLayout(){
        imageView.image = UIImage(named: selectedRecipe.imageName)
        view.addSubview(imageView)
        imageView.heightAnchor.constraint(lessThanOrEqualTo: view.heightAnchor,
                                          multiplier: 0.4,
                                          constant: 0.0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        titleText.text = selectedRecipe.title
        view.addSubview(titleText)
        titleText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        titleText.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleText.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        instructionText.text = selectedRecipe.instructions
        view.addSubview(instructionText)
        instructionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 20).isActive = true
        instructionText.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        instructionText.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        instructionText.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
