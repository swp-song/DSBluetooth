//
//  BluetoothModel.swift
//  Example
//
//  Created by Dream on 2021/12/14.
//

import Foundation


struct BluetoothModel {
    
    var title = ""
    var rssi  = ""
    
    init() {
        self.init([:])
    }
    
    init(_ data: [String : Any]) {
        
        if let title = data["name"] as? String {
            self.title = title
        }
        
        if let rssi = data["RSSI"] as? NSNumber {
            self.rssi = rssi.stringValue
        }
        
    }
    
    static func models(data: [[String : Any]]) -> [[Self]] {
        
        var models: [[Self]] = []
        
        for item in data {
            var array: [Self] = []
            let model = Self.init(item)
            array.append(model)
            models.append(array)
        }
        return models
    }
    
}
