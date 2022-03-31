//
//  DataFetch.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 19.10.2021.
//

import UIKit

import FirebaseStorage
import Firebase
import FirebaseDatabase

struct DataFetch {
    
    func fetchUserPhoto(completion: @escaping (UIImage) -> ()) {
        var image = UIImage()
        let storage = Storage.storage()
        
        if let uid = Auth.auth().currentUser?.uid{
            let _ = Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid).observe(DataEventType.value) { snapshot in
                let value = snapshot.value as? NSDictionary
                let imageLocation = value?["imageLocation"] as? String ?? "empty"
                
                let imageReference = storage.reference(forURL: imageLocation)
                imageReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error occured ", error.localizedDescription)
                    } else {
                        image = UIImage(data: data!)!
                        completion(image)
                    }
                }
                
            }
        }
        
    }
    
    func fetchCellImage(completion: @escaping (UIImage) -> ()) {
        let storage = Storage.storage()
        Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("images").child("pulse").getData { error, snapshot in
            if let error = error {
                print("Error fetching image urls", error.localizedDescription)
                return
            }
            let url = snapshot.value as! String
            let storageRef = storage.reference(forURL: url)
            print(url)
            var image = UIImage()
            storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("Error occured ", error.localizedDescription)
                } else {
                    image = UIImage(data: data!)!
                    completion(image)
                }
            }
        }
    }
    
    func getImage(url: String) -> UIImage {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: url)
        var image = UIImage()
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                print("Error occured ", error.localizedDescription)
            } else {
                image = UIImage(data: data!)!
            }
        }
        return image
    }
    
    func fetchImagesForCells(completion: @escaping ([UIImage]) -> ()) {
        let storage = Storage.storage()
        var img: [UIImage] = []
        
        Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("images").getData { error, snapshot in
            if let error = error {
                print("Error fetching image urls ", error.localizedDescription)
                return
            }
            
            var references: [String: String] = [:]
            
            for imag in snapshot.children {
                let snap = imag as! DataSnapshot
                let dict = snap.value
                references[snap.key] = dict as? String
                let storageReference = storage.reference(forURL: references[snap.key]!)
                var image = UIImage()
                storageReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        print("Error occured ", error.localizedDescription)
                    } else {
                        image = UIImage(data: data!)!
                        img.append(image)
                    }
                }
            }
            completion(img)
        }
        
    }
    
    func fetchUserName(complection: @escaping (String) -> ()) {
        if let uid = Auth.auth().currentUser?.uid {
            let _ = Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid).observe(DataEventType.value) { snapshot in
                let value = snapshot.value as? NSDictionary
                let username = value?["username"] as? String ?? "Nothing"
                complection(username)
            }
        }
    }
    
    func fetchUserEmail(complection: @escaping (String) -> ()) {
        if let uid = Auth.auth().currentUser?.uid {
            let _ = Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid).observe(DataEventType.value) { snapshot in
                let value = snapshot.value as? NSDictionary
                let email = value?["email"] as? String ?? "Nothing"
                complection(email)
            }
        }
    }
    
    func storeTheFileLocation(completion: @escaping (DatabaseReference) -> ()) {
        if let uid = Auth.auth().currentUser?.uid {
            let database = Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid).child("imageLocation")
            completion(database)
        }
    }
    
    func changeValue(completion: @escaping (DatabaseReference) -> ()) {
        if let uid = Auth.auth().currentUser?.uid {
            let database = Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("users").child(uid)
            completion(database)
        }
    }
    
}
