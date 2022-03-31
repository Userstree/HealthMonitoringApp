//
//  MainDataSource.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 10.11.2021.
//

import Foundation
import UIKit
import FirebaseStorage

enum Section {
  case main
}

typealias DataSource = UICollectionViewDiffableDataSource<Section, String>
typealias Snapshot = NSDiffableDataSourceSnapshot<Section, String>


func makeDataSource(collectionView: UICollectionView) -> DataSource {
  let dataSource = DataSource(
    collectionView: collectionView,
    cellProvider: { (collectionView, indexPath, video) -> UICollectionViewCell? in
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCell.identifier, for: indexPath) as! customCell
        
        Storage.storage()
            .reference(forURL: video)
            .getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    print("Error occured ", error.localizedDescription)
                } else {
                    cell.bg.image = UIImage(data: data!)!
                }
            }
        return cell
  })
  return dataSource
}

class customCell: UICollectionViewCell {
   
    static let identifier = "cell"
    
    let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

