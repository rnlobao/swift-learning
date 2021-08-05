//
//  SettingsViewController.swift
//  ListApp
//
//  Created by Robson Novato Lobao on 03/08/21.
//

import UIKit

class SettingsViewController : UIViewController {
    
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        setupState()
    }
    
    func setupState() {
        let userDefault = UserDefaults.standard
        if userDefault.string(forKey: "color") == "red" {
            switchButton.setOn(true, animated: true)
            return
        }
        switchButton.setOn(false, animated: true)
    }
    
    
    @IBAction func switchColor(_ sender: Any) {
        let userDefault = UserDefaults.standard
        if switchButton.isOn {
            view.backgroundColor = UIColor.red
            userDefault.setValue("red", forKey: "color")
            return
        }
        view.backgroundColor = UIColor.green
        userDefault.setValue("green", forKey: "color")
    }
}
