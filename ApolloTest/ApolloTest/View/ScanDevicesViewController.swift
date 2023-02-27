//
//  ScanDevicesViewController.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit
import CoreBluetooth

class ScanDevicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate {
    
    @IBOutlet weak var tblScooters: UITableView!
    @IBOutlet weak var searchingText: UILabel!
    @IBOutlet weak var noNearbyDevicesText: UILabel!
    
    var scooters:[CBPeripheral] = []
    var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_arrow"), style: .plain,
                                                                target: self, action: #selector(backButtonTapped(_:)))
        
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scanDevices()
    }
    
    @objc func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func scanDevices() {
        searchingText.isHidden = false
        scooters.removeAll()

        centralManager.scanForPeripherals(withServices: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 60.0) {
            self.centralManager.stopScan()
            self.searchingText.isHidden = true
            self.updateNearbyDevicesStatus()
        }
    }
    
    private func updateNearbyDevicesStatus() {
        noNearbyDevicesText.isHidden = scooters.count != 0
    }
    
    // MARK: - CENTRAL MANAGER
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if let name = peripheral.name {
            scooters.append(peripheral)
            print("Discovered \(name)")
        }

        self.tblScooters.reloadData()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            presentAlert(withTitle: "Error", message: "Bluetooth is not supported.")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            presentAlert(withTitle: "Error", message: "Bluetooth is not connected.")
        case .poweredOn:
            print("central.state is .poweredOn")
        @unknown default:
            fatalError()
        }
    }
    
    func centralManager( central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected to "+peripheral.name!)
    }

    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error!)
    }

    
    // MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scooters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScooterTableViewCell", for: indexPath) as! ScooterTableViewCell
        
        let scooter = scooters[indexPath.row]
        cell.scooterNameText.text = scooter.name
        
        return cell
    }

    // MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scooter = scooters[indexPath.row]
        print(scooter)
        self.presentAlert(withTitle: scooter.name ?? "No name", message: "\(scooter.identifier), \(scooter.state)")
    }
}

extension UIViewController {
    func presentAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
