//
//  HelmetLockViewController.swift
//  NBIoTBleKitDemoSwift
//
//  Created by yun.ao on 2021/11/16.
//

import UIKit
import NBIoTBleKit

class HelmetLockViewController: UIViewController {
    @IBOutlet weak var macaddressField: UITextField!
    @IBOutlet weak var deviceKeyField: UITextField!
    @IBOutlet weak var logTextView: UITextView!
    
    lazy var helmetLockController: NBHelmetBle = {
        let controller = NBHelmetBle()
        controller.delegate = self
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func connect(_ sender: Any) {
        guard let macaddress = self.macaddressField.text,
                let deviceKey = self.deviceKeyField.text else { return }
        helmetLockController.connectDevice(
            byMacaddress: macaddress,
            andDeviceKey: deviceKey
        )
    }
    
    @IBAction func disconnect(_ sender: Any) {
        helmetLockController.disconnect()
    }
    
    @IBAction func unlock(_ sender: Any) {
        helmetLockController.unlock()
    }
    
    @IBAction func queryLockStatus(_ sender: Any) {
        helmetLockController.queryLockStatus()
    }
    
    @IBAction func queryLockInfo(_ sender: Any) {
        helmetLockController.queryLockInfo()
    }
}


extension HelmetLockViewController {
    func append(_ logText: String) {
        logTextView.text = logTextView.text + "\n" + logText
    }
    
    func log(_ text: String) {
        print(text)
        append(text)
    }
}


extension HelmetLockViewController: NBHelmetBleDeleagate {
    func unlockHelmetLockResult(_ isSuccess: Bool, withError error: Error?) {
        if isSuccess {
            log("unlock successful!")
        } else {
            log("unlock failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func queryHelmetLockStatusResult(_ helmetLockStatus: NBHelmetLockStatus?, withError error: Error?) {
        if let status = helmetLockStatus {
            log("get helmet lock status successful! \(status)")
        } else {
            log("failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func queryHelmetLockInfomationResult(_ helmetLockInfo: NBHelmetLockInfo?, withError error: Error?) {
        if let info = helmetLockInfo {
            log("get helmet lock info successful! \(info)")
        } else {
            log("failed! \(error?.localizedDescription ?? "")")
        }
    }
}
