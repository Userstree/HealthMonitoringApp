//
//  ViewController.swift
//  HealthMonitoringApp
//
//  Created by Dossymkhan Zhulamanov on 10.09.2021.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class MainViewController: UIViewController, UICollectionViewDelegate {
    
// MARK: - Properties
    var mainView = MainView()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    private lazy var dataSource = makeDataSource(collectionView: collectionView)
    
    let navController = UINavigationController()
    
// MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        configureViewComponents()
        
        getImagesForCells()
    }
    
// MARK: Navigation
    func navigationControl() {
        navigationController?.viewControllers = [LoginController()]
        navigationController?.popToRootViewController(animated: true)
    }
        
    let segmentedControl: UISegmentedControl = {
        let data = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.cyan]
        let sc = UISegmentedControl(items: data)
        sc.setTitleTextAttributes(titleTextAttributes, for: .normal)
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    let userSettings: UIButton = {
        let btn = UIButton()
        let img = UIImage(systemName: "square.and.pencil")
        img?.withTintColor(.green)
        btn.setImage(img, for: .normal)
        btn.addTarget(self, action: #selector(handleUserSettings), for: .touchUpInside)
        btn.setTitle("Edit", for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        return btn
    }()
    
    func authenticateUserAndConfigureView() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let navController = UINavigationController(rootViewController: LoginController())
                self.present(navController, animated: true, completion: nil)
            }
        } else {
            configureViewComponents()
        }
    }
    
//MARK: - Selectors
    @objc func handleSignOut(){
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to sign out?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            self.signOut()
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.navigationControl()
        } catch let error {
            print("Signed Out with error", error)
        }
    }
    
    @objc func handleUserSettings() {
        let settingsVC = SettingsViewController()
        guard let navVC = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else {
            return
        }
        navVC.pushViewController(settingsVC, animated: true)
    }
    
    
//MARK: Helper Functions
    
    func getImagesForCells() {
        Database.database(url: "https://healthmonitoring-1ca88-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("images").getData { error, snapshot in
            if let error = error {
                print("Error fetching image urls ", error.localizedDescription)
                return
            }
            
            let images = snapshot.children.map { it in
                (it as! DataSnapshot).value as! String
            }
            
            var snapshot = Snapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(images)
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    func configureViewComponents() {
        
        view.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        navigationItem.title = "Main View"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "sign_out"), style: .plain, target: self, action: #selector(handleSignOut))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        mainView.frame = self.view.frame
        view.addSubview(mainView)
        
        configureCollectionView()
        
        view.addSubview(segmentedControl)
        segmentedControl.anchor(top: nil, left: nil, bottom: collectionView.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 350, height: 45)
    
        view.addSubview(userSettings)
        userSettings.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 112, paddingleft: 0, paddingBottom: 0, paddingRight: -25, width: 100, height: 30)
    
    }
    
    func configureCollectionView() {
        layout.itemSize = CGSize(width: (view.frame.width / 2.25)-4, height: (view.frame.height / 3.2)-4)
        collectionView.backgroundColor = UIColor.mainDarkBlueBackgroundColor()
        collectionView.register(customCell.self, forCellWithReuseIdentifier: customCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        collectionView.frame = view.bounds
        view.addSubview(collectionView)
        collectionView.anchor(top: mainView.greeting.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 160, paddingleft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let monitorVC = MonitorViewController()
        navigationController?.pushViewController(monitorVC, animated: true)
    }
    
}
