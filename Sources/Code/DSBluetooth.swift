
import DSBase
import CoreBluetooth

public class DSBluetooth: NSObject {
    
    var dataSource: (models: [Bluetooth], datas: [[String : Any]]) = ([], [])
    
    weak var delegate: DSBluetoothDelegate? = nil
    
    var bluetoothScanning: BluetoothScanning? = nil
    
    
    lazy var centralManager: CBCentralManager = {
        let centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
        return centralManager
    }()
    
    public override init() {
        super.init()
    }
}

public extension DSBluetooth {
    
    typealias BluetoothScanning = (_ models: [Bluetooth], _ datas: [[String : Any]]) -> Void
    
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
        guard let _ = peripheral.name else { return }
        
        dataSource = Bluetooth.bluetooths(dataSource: dataSource, central: central, peripheral: peripheral, advertisementData: advertisementData, RSSI: RSSI)
        bluetoothScanning?(dataSource.models, dataSource.datas)
        delegate?.bluetoothScanning(models: dataSource.models, datas: dataSource.datas)
    }
    
}

extension DSBluetooth: DSCompatible { }

//
public extension DS where DSBase == DSBluetooth {
    
    weak var delegate: DSBluetoothDelegate? {
        set { ds.delegate = newValue }
        get { ds.delegate }
    }
    
    var bluetoothScanning: DSBluetooth.BluetoothScanning? {
        set { ds.bluetoothScanning = newValue }
        get { ds.bluetoothScanning }
        
    }
    
}


// MARK: - function
public extension DS where DSBase == DSBluetooth {
    
    func scan() -> Void {
        ds.scan()
    }
    
    func bluetoothScanning(bluetoothScanning: DSBluetooth.BluetoothScanning? ) -> Void {
        ds.bluetoothScanning = bluetoothScanning
    }
    
}
