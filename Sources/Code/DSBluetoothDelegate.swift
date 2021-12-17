//
//  DSBluetoothDelegate.swift
//  DSBluetooth
//
//  Created by Dream on 2021/12/16.
//

import Foundation

public protocol DSBluetoothDelegate: NSObjectProtocol {
    
    func bluetoothScanning(models: [Bluetooth], datas: [[String : Any]]) -> Void
    
}

extension DSBluetoothDelegate {
    
    func bluetoothScanning(models: [Bluetooth], datas: [[String : Any]]) -> Void {
        
    }
    
}
