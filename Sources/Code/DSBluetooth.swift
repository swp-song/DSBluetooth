
import DSBase
import CoreBluetooth

public class DSBluetooth: NSObject {
    
    var dataSource: [Bluetooth] = []
    
    
    lazy var centralManager: CBCentralManager = {
        let centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        return centralManager
    }()
    
    public override init() {
        super.init()
    }
    
}

private extension DSBluetooth {
    
    func scan() -> Void {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    
    func createBluetooth(peripheral: CBPeripheral, advertisement: [String : Any], RSSI: NSNumber) -> Void {
        
    }
    
    func createBluetooths(datas: [[String : Any]], central: CBCentralManager, peripheral: CBPeripheral, advertisement: [String : Any], RSSI: NSNumber) -> Void {
        
    }
    
}

extension DSBluetooth: CBCentralManagerDelegate {
    
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print(central.state)
            
        switch central.state {
            case .unknown:
                print("unknown")
            case .resetting:
                print("resetting")
            case .unsupported:
                print("unsupported")
            case .unauthorized:
                print("unauthorized")
            case .poweredOff:
                print("poweredOff")
            case .poweredOn:
                print("poweredOn")
                scan()
            @unknown default:
                print("unknown default")
        }
    }
    
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else { return }
        print(name)
        self.dataSource = Bluetooth.bluetoothDatas(dataSource: self.dataSource, central: central, peripheral: peripheral, advertisementData: advertisementData, RSSI: RSSI)
        print(self.dataSource)
    }
    
}

extension DSBluetooth: DSCompatible { }

public extension DS where DSBase == DSBluetooth {
    
    func scan() -> Void {
        ds.scan()
    }
    
    var dataSource: [DSBluetooth.Bluetooth] {
        return ds.dataSource
    }
    
    
}
