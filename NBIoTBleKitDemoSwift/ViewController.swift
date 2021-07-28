//
//  ViewController.swift
//  NBIoTBleKitDemoSwift
//
//  Created by yun.ao on 2021/7/7.
//

import UIKit
import NBIoTBleKit

class ViewController: UIViewController {
    @IBOutlet weak var imeiTextfield: UITextField!
    
    @IBOutlet weak var macaddressTextfield: UITextField!
    
    @IBOutlet weak var deviceKeyTextfield: UITextField!
    
    @IBOutlet weak var logTextView: UITextView!
    
    lazy var iotControllTool: NBIoTBle = {
        let controllTool = NBIoTBle()
        controllTool.delegate = self
        return controllTool
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        logTextView.text = nil
    }
    
    @IBAction func connectAction(_ sender: UIButton) {
        guard let imei = imeiTextfield.text,
              let macAddress = macaddressTextfield.text,
              let deivceKey = deviceKeyTextfield.text else { return }
        
        iotControllTool.connectDevice(byIMEI: imei, macAddress: macAddress, andDeviceKey: deivceKey)
    }
    
    @IBAction func disconnectAction(_ sender: Any) {
        iotControllTool.disconnect()
    }
    
    @IBAction func unlcokAction(_ sender: UIButton) {
        iotControllTool.unlock()
    }
    
    @IBAction func lockAction(_ sender: UIButton) {
        iotControllTool.lock()
    }
    
    @IBAction func openBatteryCover(_ sender: UIButton) {
        iotControllTool.openBatteryCover()
    }
    
    @IBAction func openTailBox(_ sender: UIButton) {
        iotControllTool.openTailBox()
    }
    
    @IBAction func queryIoTInfomationAction(_ sender: UIButton) {
        iotControllTool.queryIoTInformation()
    }
    
    @IBAction func queryVehicleInformationAction(_ sender: UIButton) {
        iotControllTool.queryVehicleInformation()
    }
    
    @IBAction func openSaddle(_ sender: UIButton) {
        iotControllTool.openSaddle()
    }
}

// MARK: - Private Method
extension ViewController {
    private func append(_ logText: String) {
        logTextView.text = logTextView.text + "\n" + logText
    }
    
    private func log(_ text: String) {
        print(text)
        append(text)
    }
}

extension ViewController: NBIoTBleDelegate {
    func bluetoothStateChanged(_ state: CBManagerState) {
        log("bluetooth state changed: \(state.rawValue)")
    }
    
    func connectionStateChange(_ state: ConnectionState) {
        log("connection state changed: \(state.rawValue)")
    }
    
    func connectDevice(onError error: Error?) {
        log("connect device on error: \(error.debugDescription)")
    }
    
    func unlockScooterResult(_ isSuccess: Bool, withError error: Error?) {
        if isSuccess {
            log("unlock successful!")
        } else {
            log("unlock failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func lockScooterResult(_ isSuccess: Bool, withError error: Error?) {
        if isSuccess {
            log("lock successful!")
        } else {
            log("lock failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func openBatteryCoverResult(_ isFinished: Bool, withError error: Error?) {
        if isFinished {
            log("open battery cover successful!")
        } else {
            log("open battery cover failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func openSaddleResult(_ isFinished: Bool, withError error: Error?) {
        if isFinished {
            log("open saddle successful!")
        } else {
            log("open saddle failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func openTailboxResult(_ isFinished: Bool, withError error: Error?) {
        if isFinished {
            log("open tail box successful!")
        } else {
            log("open tail box failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func queryVehicleInformationResult(_ scooterInfo: NBVehicleInfo?, withError error: Error?) {
        if let scooterInfo = scooterInfo {
            log("query scooter info success:\n \(scooterInfo.description)")
        } else {
            log("open tail box failed! \(error?.localizedDescription ?? "")")
        }
    }
    
    func queryIoTInfomationResult(_ iotInfo: NBIoTInfo?, withError error: Error?) {
        if let iotInfo = iotInfo {
            log("query IoT info success:\n \(iotInfo.description)")
        } else {
            log("open tail box failed! \(error?.localizedDescription ?? "")")
        }
    }
}

