//
//  category.swift
//  EatinProgram
//
//  Created by Amarprakash Mishra on 03/02/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class categoryCell : UITableViewCell{
    
    var foodCategory : FoodCategory? {
        didSet{
            guard let unwrapped = foodCategory else { return }
            imgView.image = UIImage(named: unwrapped.imageName)
            textView.text = unwrapped.title
            //print("jfhjd \(textView.text)")
        }
    }
    
    let imgView : UIImageView = {
       let img = UIImage(named: "burger0")
       let imgView = UIImageView(image: img)
       imgView.translatesAutoresizingMaskIntoConstraints = false
       imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        imgView.layer.cornerRadius = 20
       return imgView
    }()
    
    let textView : UITextView = {
        let textView = UITextView()
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "AMAR"
        textView.font = UIFont.boldSystemFont(ofSize: 35)
        textView.textColor = .white
        textView.backgroundColor = .clear
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout(){

        contentView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant : 20).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant : -20).isActive = true
        imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        imgView.addSubview(textView)
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: imgView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: -20).isActive = true
    }
    
}
