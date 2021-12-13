//
//  DSBluetooth+Bluetooth.swift
//  DSBluetooth
//
//  Created by Dream on 2021/12/12.
//

import Foundation
import CoreBluetooth
import DSBase

public extension DSBluetooth {
    
    struct Bluetooth: CustomStringConvertible {
        
        private var datas: [String: Any]
        
        init(_ bluetoothData: [String : Any]) {
            self.datas = bluetoothData
        }
        
        public var description: String {
            return ""
        }
        
    }
}


extension DSBluetooth.Bluetooth {
    
    static func bluetoothDatas(dataSource: [Self], central: CBCentralManager, peripheral: CBPeripheral, advertisementData: [String : Any], RSSI: NSNumber) -> [Self] {
        var data = advertisementData;
        data["central"]     = central
        data["peripheral"]  = peripheral
        data["RSSI"]        = RSSI
        
        var datas: [Self] = dataSource
        
        let bluetooth = DSBluetooth.Bluetooth(data)
        
        if dataSource.count == 0 {
            datas.append(bluetooth)
        } else {
            
            var isExist = false
            for (index, item) in dataSource.enumerated() where item.peripheral?.identifier == peripheral.identifier {
                datas.remove(at: index)
                datas.insert(bluetooth, at: index)
                isExist = true
            }
            
            if isExist == false {
                datas.append(bluetooth)
            }
        }
        
        return datas
    }
}

public extension DSBluetooth.Bluetooth {
    
    var bluetoothData: [String : Any] {
        return datas
    }
    
    var central: CBCentralManager? {
        return bluetoothData["central"] as? CBCentralManager
    }
    
    var peripheral: CBPeripheral? {
        return bluetoothData["peripheral"] as? CBPeripheral
    }
    
    var name: String {
        guard let name = peripheral?.name else { return "" }
        return name
    }
    
    var state: CBManagerState {
        guard let state = central?.state else { return .unknown }
        return state
    }
    
    
    var RSSI: NSNumber {
        guard let rssi = bluetoothData["RSSI"] as? NSNumber else { return NSNumber(0) }
        return rssi
    }
    
    var identifier: UUID {
        guard let identifier = peripheral?.identifier else { return UUID() }
        return identifier
    }
    
    var CBUUIDS: [CBUUID] {
        guard let CBUUIDS = bluetoothData["kCBAdvDataServiceUUIDs"] as? [CBUUID] else { return [] }
        return CBUUIDS
    }
}

