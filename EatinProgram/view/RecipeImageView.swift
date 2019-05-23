//
//  RecipeImageView.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 04/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation
import UIKit

class RecipeImageView : UIView {
    let imageView : UIImageView = {
        let image = UIImage(named: "leaf_third")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
}
