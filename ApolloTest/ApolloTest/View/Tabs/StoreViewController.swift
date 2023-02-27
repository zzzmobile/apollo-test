//
//  StoreViewController.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class StoreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var scootersCollectionView: UICollectionView!
    @IBOutlet weak var accessoriesCollectionView: UICollectionView!
    @IBOutlet weak var upgradesCollectionView: UICollectionView!
    
    var scooters:[Scooter] = []
    var accesorries:[ScooterAccessory] = []
    var scooterUpgrades:[ScooterUpgrade] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // add margin and register uicollectionviewcell classes
        scootersCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
        scootersCollectionView.register(UINib(nibName: "ScooterCell", bundle: nil), forCellWithReuseIdentifier: "ScooterCell")
        accessoriesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
        accessoriesCollectionView.register(UINib(nibName: "AccessoryCell", bundle: nil), forCellWithReuseIdentifier: "AccessoryCell")
        upgradesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
        upgradesCollectionView.register(UINib(nibName: "UpgradeCell", bundle: nil), forCellWithReuseIdentifier: "UpgradeCell")
        
        // add test data
        scooters.append(Scooter(title: "THEFT AND LOSS", name: "Apollo Care + Theft and Loss", fixed: 129.0, monthly: 6.99))
        scooters.append(Scooter(title: "APOLLO CARE", name: "Apollo Care", fixed: 129.0, monthly: 6.99))
        scooters.append(Scooter(title: "APOLLO CARE", name: "Apollo Care", fixed: 129.0, monthly: 6.99))
        scooters.append(Scooter(title: "APOLLO CARE", name: "Apollo Care", fixed: 129.0, monthly: 6.99))
        accesorries.append(ScooterAccessory(name: "Apollo Bag", details: "Some interesting description here", price: 19.99))
        accesorries.append(ScooterAccessory(name: "Apollo Bag", details: "Some interesting description here", price: 19.99))
        scooterUpgrades.append(ScooterUpgrade(name: "Phantom V3 Kit", details: "At magnum periculum adiit in oculis quidem exercitus quid ex eo delectu rerum."))
        scooterUpgrades.append(ScooterUpgrade(name: "Phantom V3 Kit", details: "At magnum periculum adiit in oculis quidem exercitus quid ex eo delectu rerum."))
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.scootersCollectionView {
            return scooters.count
        } else if collectionView == self.accessoriesCollectionView {
            return accesorries.count
        } else {
            return scooterUpgrades.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.scootersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScooterCell", for: indexPath) as! ScooterCell
            cell.setScooter(scooter: scooters[indexPath.row])
            return cell
        } else if collectionView == self.accessoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccessoryCell", for: indexPath) as! AccessoryCell
            cell.setAccessory(accessory: accesorries[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpgradeCell", for: indexPath) as! UpgradeCell
            cell.setUpgradeInfo(upgradeInfo: scooterUpgrades[indexPath.row])
            return cell
        }
        
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.upgradesCollectionView {
            var width = 343.0
            if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
                let screenFrame = window.frame
                width = screenFrame.width
            }
            return CGSize(width: width - 32, height: 380.0)
        } else {
            return CGSize(width: 242.0, height: 329.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
}

