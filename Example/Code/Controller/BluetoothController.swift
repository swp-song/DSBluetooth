//
//  ViewController.swift
//  Example
//
//  Created by Dream on 2021/11/30.
//

import UIKit

import DSBluetooth

class BluetoothController: UIViewController {
    
    

    var bluetooth = DSBluetooth()
    
    @IBOutlet private weak var bluetoothView: BluetoothTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Bluetooth List"
        bluetooth.ds.delegate = self
        bluetooth.ds.scan()
        
        bluetooth.ds.bluetoothScanning { [weak self] models, datas in
            let aModels = BluetoothModel.models(data: datas)
            self?.bluetoothView.datas = aModels
        }
        
        
    }

}

extension BluetoothController: DSBluetoothDelegate {

    func bluetoothScanning(models: [Bluetooth], datas: [[String : Any]]) {
        let aModels = BluetoothModel.models(data: datas)
        bluetoothView.datas = aModels
    }
}

