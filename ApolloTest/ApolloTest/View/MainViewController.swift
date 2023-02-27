//
//  ViewController.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showBluetoothDevicesVC(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ScanDevicesViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func showStoreDesignVC(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StoreDesignViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

