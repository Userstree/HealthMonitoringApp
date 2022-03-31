//
//  MainView.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 18.10.2021.
//

import UIKit
import FirebaseStorage
import FirebaseDatabase
import Firebase

class MainView: UIView {
    
    var imageModel = [Image_ViewModel]()
            
    let avatarLabel: UIImageView = {
        let imageView = UIImageView()
        var fetch = DataFetch()
        
        fetch.fetchUserPhoto { image in
            imageView.image = image
        }
        
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        var fetch = DataFetch()
        label.font = UIFont.systemFont(ofSize: 24)
        fetch.fetchUserName { username in
            label.text = username
        }
        label.textColor = .white
        return label
    }()
    
    let greeting: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        
        let date = NSDate()
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: date as Date)
        let hourInt = Int(currentHour.description)!
        
        var greeting = ""
        
        if hourInt >= 12 && hourInt <= 16 {
            greeting = "Good Afternoon"
        }
        else if hourInt >= 7 && hourInt <= 12 {
            greeting = "Good Morning"
        }
        else if hourInt >= 16 && hourInt <= 20 {
            greeting = "Good Evening"
        }
        else if hourInt >= 20 && hourInt <= 24 {
            greeting = "Good Night"
        }
        else if hourInt >= 0 && hourInt <= 7 {
            greeting = "You should be sleeping right now"
        }
        
        label.text = greeting
        
        label.textColor = .white
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureComponents()
    }

    func configureComponents() {
        
        addSubview(avatarLabel)
        avatarLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 120, paddingleft: 20, paddingBottom: 0, paddingRight: 0, width: 70, height: 70)

        addSubview(usernameLabel)
        usernameLabel.anchor(top: topAnchor, left: avatarLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 140, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
    
        addSubview(greeting)
        greeting.anchor(top: nil, left: avatarLabel.rightAnchor, bottom: usernameLabel.topAnchor, right: nil, paddingTop: 0, paddingleft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init?(coder) is not supported")
    }
    
}

