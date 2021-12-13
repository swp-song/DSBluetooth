//
//  BluetoothTableView.swift
//  Example
//
//  Created by Dream on 2021/12/13.
//

import UIKit

class BluetoothTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var datas: [Any] = []
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupBluetoothTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBluetoothTableView()
    }
    
}

extension BluetoothTableView {
    
    func setupBluetoothTableView() -> Void {
        
        datas.append(1)
        datas.append(1)
        datas.append(1)
        
        
//        style = .insetGrouped
        register(BluetoothCell.NIB, forCellReuseIdentifier: BluetoothCell.identifier)
        self.dataSource = self
    }
    
}

extension BluetoothTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BluetoothCell.identifier, for: indexPath)
        return cell
    }
    
    
}
