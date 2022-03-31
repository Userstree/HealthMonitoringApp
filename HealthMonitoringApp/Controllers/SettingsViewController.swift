//
//  SettingsViewController.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 28.10.2021.
//

import UIKit
import FirebaseStorage

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        let loadImage = DataFetch()
        loadImage.fetchUserPhoto(completion: { image in
            img.image = image
        })
        img.contentMode = .scaleAspectFit
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleChangeAvatar) ))
        img.isUserInteractionEnabled = true
        return img
    }()
    
    @objc func handleChangeAvatar() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage?
        if let editedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            selectedImage = originalImage
        }
        
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        if let pickedImage = selectedImage {
            profileImageView.image = pickedImage
            let uploadImage = pickedImage.pngData()!
            let storage = Storage.storage().reference().child("userProfileImage.jpeg")
            storage.putData(uploadImage, metadata: meta)
            
            let data = DataFetch()
            data.storeTheFileLocation { reference in
                let path = "gs://healthmonitoring-1ca88.appspot.com"
                reference.setValue(path + "/" + storage.fullPath)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    let changeUsername: UITextField = {
        let tf = UITextField()
        let fetch = DataFetch()
        fetch.fetchUserName { text in
            tf.placeholder = text
        }
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 6
        tf.isSecureTextEntry = false
        tf.setLeftIcon(UIImage(named: "person_male")!)
        return tf
    }()
    
    let changeEmail: UITextField = {
        let tf = UITextField()
        let fetch = DataFetch()
        fetch.fetchUserEmail { email in
            tf.placeholder = email
        }
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 6
        tf.isSecureTextEntry = false
        tf.setLeftIcon(UIImage(named: "email_icon")!)
        return tf
    }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
        return btn.setWideGreenButton(title: "Safe Changes")
    }()
    
    @objc func handleSave() {
        let database = DataFetch()
        
        if changeUsername.text != ""{
            if let text = changeUsername.text {
                database.changeValue { data in
                    data.updateChildValues(["username": text])
                }
            }
        }
        
        if changeEmail.text != ""{
            if let txt = changeEmail.text {
                database.changeValue { data in
                    data.updateChildValues(["email": txt])
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        
        view.addSubview(containerView)
        containerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300)
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(changeUsername)
        changeUsername.anchor(top: profileImageView.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, paddingTop: 20, paddingleft: -125, paddingBottom: 0, paddingRight: 0, width: 250, height: 45)
        
        view.addSubview(changeEmail)
        changeEmail.anchor(top: changeUsername.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, paddingTop: 20, paddingleft: -125, paddingBottom: 0, paddingRight: 0, width: 250, height: 45)
        
        view.addSubview(saveButton)
        saveButton.anchor(top: changeEmail.bottomAnchor, left: view.centerXAnchor, bottom: nil, right: nil, paddingTop: 20, paddingleft: -75, paddingBottom: 0, paddingRight: 0, width: 150, height: 45)
        saveButton.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        
    }
    
}
