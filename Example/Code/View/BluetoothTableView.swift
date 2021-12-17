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

    var datas: [[BluetoothModel]]  {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        self.datas = []
        super.init(frame: frame, style: style)
        setupBluetoothTableView()
        
    }
    
    required init?(coder: NSCoder) {
        self.datas = []
        super.init(coder: coder)
        setupBluetoothTableView()
        
    }
    
}

extension BluetoothTableView {
    
    func setupBluetoothTableView() -> Void {
        register(BluetoothCell.NIB, forCellReuseIdentifier: BluetoothCell.identifier)
        self.dataSource = self
        self.delegate   = self
    }
    
}

extension BluetoothTableView: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BluetoothCell = tableView.dequeueReusableCell(withIdentifier: BluetoothCell.identifier, for: indexPath) as! BluetoothCell
        cell.model = datas[indexPath.section][indexPath.row]
        return cell
    }
    
}

extension BluetoothTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80
    }
}
