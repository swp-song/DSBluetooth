//
//  BluetoothCell.swift
//  Example
//
//  Created by Dream on 2021/12/13.
//

import UIKit

class BluetoothCell: UITableViewCell {
    
    
    @IBOutlet private  weak var titleLabel: UILabel!
    @IBOutlet private weak var rssiLabel: UILabel!
    
    var model: BluetoothModel  {
        didSet {
            titleLabel.text = model.title
            rssiLabel.text  = "RSSI: " + model.rssi
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        model = BluetoothModel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        model = BluetoothModel()
        super.init(coder: coder)
    }
    
}

extension BluetoothCell {

    static var identifier: String {
        
        let temp = NSStringFromClass(Self.self)
        
        if temp.contains(".") {
            guard let identifier = temp.components(separatedBy: ".").last else { return "" }
            return identifier
        }
        return temp
    }
    
    static var NIB: UINib {
        let nib = UINib(nibName: Self.identifier, bundle: Bundle.main)
        return nib
    }
    
}
