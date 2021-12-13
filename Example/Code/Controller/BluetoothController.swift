//
//  ViewController.swift
//  Example
//
//  Created by Dream on 2021/11/30.
//

import UIKit

import DSBluetooth

class BluetoothController: UIViewController {

    let bluetooth = DSBluetooth()
    
    @IBOutlet private weak var bluetoothView: BluetoothTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
//        view.addSubview(bluetoothView)
//        bluetoothView.frame = view.frame
//        bluetoothView.backgroundColor = UIColor.red
//
    }


}

