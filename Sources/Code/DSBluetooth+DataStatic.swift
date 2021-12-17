//
//  DSBluetooth+Bluetooth.swift
//  DSBluetooth
//
//  Created by Dream on 2021/12/12.
//

import Foundation
import CoreBluetooth
//import DSBase

public struct Bluetooth: CustomStringConvertible {
    
    private var datas: [String: Any]
    
    init(_ bluetoothData: [String : Any]) {
        self.datas = bluetoothData
    }
    
    public var description: String {
        return ""
    }
    
}

enum DataKey: String {
    case name
    case central
    case peripheral
    case RSSI
    case kCBAdvDataServiceUUIDs
}

extension Bluetooth {
    
    static func bluetooths(dataSource: (models: [Self], datas: [[String : Any]]), central: CBCentralManager, peripheral: CBPeripheral, advertisementData: [String : Any], RSSI: NSNumber) -> (models: [Self], datas: [[String : Any]]) {
        
        var data = advertisementData;
        data[DataKey.central.rawValue]     = central
        data[DataKey.peripheral.rawValue]  = peripheral
        data[DataKey.RSSI.rawValue]        = RSSI
        data[DataKey.name.rawValue]        = peripheral.name ?? ""
        
        var models = dataSource.models
        var datas  = dataSource.datas
        
        let bluetooth = Bluetooth(data)
        
        if models.count == 0 {
            models.append(bluetooth)
            datas.append(data)
        } else {
            
            var isExist = false
            for (index, item) in dataSource.models.enumerated() where item.peripheral?.identifier == peripheral.identifier {
                models.remove(at: index)
                models.insert(bluetooth, at: index)
                datas.remove(at: index)
                datas.insert(data, at: index)
                
                isExist = true
            }
            
            if isExist == false {
                models.append(bluetooth)
                datas.append(data)
            }
            
        }
        
        return (models, datas)
    }
    
}

public extension Bluetooth {
    
    var bluetoothData: [String : Any] {
        return datas
    }
    
    var central: CBCentralManager? {
        return bluetoothData[DataKey.central.rawValue] as? CBCentralManager
    }
    
    var peripheral: CBPeripheral? {
        return bluetoothData[DataKey.peripheral.rawValue] as? CBPeripheral
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
        guard let rssi = bluetoothData[DataKey.RSSI.rawValue] as? NSNumber else { return NSNumber(0) }
        return rssi
    }
    
    var identifier: UUID {
        guard let identifier = peripheral?.identifier else { return UUID() }
        return identifier
    }
    
    var CBUUIDS: [CBUUID] {
        guard let CBUUIDS = bluetoothData[DataKey.kCBAdvDataServiceUUIDs.rawValue] as? [CBUUID] else { return [] }
        return CBUUIDS
    }
}

