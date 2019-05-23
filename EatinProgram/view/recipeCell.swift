//
//  recipeCell.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 03/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class recipeCell : UICollectionViewCell{
    var recipe : Recipe? {
        didSet{
            guard let unwrappedRecippe = recipe else { return }
            imgView.image = UIImage(named: unwrappedRecippe.imageName)
            print("kksk ", unwrappedRecippe.imageName)
        }
    }
    
    let imgView : UIImageView = {
        let img = UIImage(named: "burger1")
        let imgView = UIImageView(image: img)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        imgView.layer.cornerRadius = 20
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(" init(coder:) has not been implemented ")
    }
    
    func setUpLayout(){
        contentView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:
            -10).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:
            -10).isActive = true
    }
    
}
