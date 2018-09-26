//
//  Profile.swift
//  GoodBoy
//
//  Created by Dev on 9/24/18.
//  Copyright © 2018 pairso. All rights reserved.
//

import Foundation
import UIKit


class ProfileView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gbPurple
        setupProfile()
        
        logout.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        deleteAccount.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        changePassword.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    }
    
    //views
    let profileView : UIView = {
        let view = UIView()
        
        return view
    }()
    let favoritesView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainGreen
        view.layer.borderColor = UIColor.mainGray.cgColor

        return view
    }()
    
    //content
    let profileLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gbWhite
        lbl.text = "Profile"
        lbl.font = .boldSystemFont(ofSize: FontSize.xXXLarge.rawValue)
        
        return lbl
    }()
    var nameTextField : TextFieldWithImage = {
        let tf = TextFieldWithImage()
        tf.leftImage = #imageLiteral(resourceName: "profile")
        tf.leftPadding = 5
        tf.textColor = .white
        tf.placeholder = " Gifton Okoronkwo"
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:0.47, green:0.49, blue:0.66, alpha:1.0)
        tf.minimumFontSize = FontSize.xLarge.rawValue
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.setHeightWidth(width: 300, height: 40)
        return tf
    }()
    var emailTextField : TextFieldWithImage = {
        let tf = TextFieldWithImage()
        tf.leftImage = #imageLiteral(resourceName: "email")
        tf.leftPadding = 5
        tf.textColor = .white
        tf.placeholder = " Giftono@gmail.com"
        tf.layer.cornerRadius = 5
        tf.backgroundColor = UIColor(red:0.47, green:0.49, blue:0.66, alpha:1.0)
        tf.minimumFontSize = FontSize.xLarge.rawValue
        tf.adjustsFontSizeToFitWidth = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.setHeightWidth(width: 300, height: 40)
        return tf
    }()
    let changePassword : UIButton = {
        let btn = UIButton()
        btn.setTitle(" Change Password ", for: .normal)
        btn.backgroundColor = .gbBlue
        btn.setHeightWidth(width: 300, height: 40)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let logout : UIButton = {
        let btn = UIButton()
        btn.setTitle("Logout", for: .normal)
        btn.backgroundColor = .gbOrange
        btn.setHeightWidth(width: 300, height: 40)
        btn.layer.cornerRadius = 5
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let deleteAccount : UIButton = {
        let btn = UIButton()
        btn.setTitle("Delete Account", for: .normal)
        btn.setHeightWidth(width: 300, height: 40)
        btn.layer.cornerRadius = 5
        btn.backgroundColor = UIColor.gbRed
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupProfile() {
        addSubview(profileView)
        profileView.frame = CGRect(x: 10, y: 50, width: ScreenSize.SCREEN_WIDTH - 20, height: ScreenSize.SCREEN_HEIGHT / 1.75)
        
        //build stackview for buttons
        let profileButtonStack = UIStackView(arrangedSubviews: [changePassword, logout, deleteAccount])
        profileButtonStack.spacing = 10
        profileButtonStack.axis = .vertical
        profileButtonStack.alignment = .center
        
        profileButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        //setup ProfileView
        profileView.addSubview(profileLabel)
        profileView.addSubview(nameTextField)
        profileView.addSubview(emailTextField)
        profileView.addSubview(profileButtonStack)
        
        profileLabel.frame = CGRect(x: 10, y: 10, width: 100, height: 40)
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 30),
            nameTextField.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 25),
            emailTextField.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 30),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            profileButtonStack.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            profileButtonStack.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25)
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonPressed(sender : UIButton) {
        let OGColor = sender.backgroundColor
        UIView.animate(withDuration: 0.5, animations: {
            sender.backgroundColor = UIColor.gbWhite
        }) { (true) in
            UIView.animate(withDuration: 0.25, animations: {
                sender.backgroundColor = OGColor
            })
        }
        print("button color changed!")
    }
}

