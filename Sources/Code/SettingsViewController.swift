//
//  SettingsViewController.swift
//  Prayer
//
//  Created by Cihat Gündüz on 09.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlets

    @IBOutlet var rakatCountInputField: UITextField!
    @IBOutlet var textSpeedSegmentedControl: UISegmentedControl!


    // MARK: - IBActions

    @IBAction func didPressStartButton() {
        guard let text = rakatCountInputField.text, let rakatCount = UInt(text) else { return }

        let prayerViewCtrl = StoryboardScene.Prayer.initialViewController()
        let navCtrl = UINavigationController(rootViewController: prayerViewCtrl)
        present(navCtrl, animated: true) {
            let salah = Salah(rakatCount: rakatCount)
            let textSpeedFactor: Double = 1.0 + Double(self.textSpeedSegmentedControl.selectedSegmentIndex - 1) * 0.33
            prayerViewCtrl.start(salah: salah, textSpeedFactor: textSpeedFactor)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        self.view.endEditing(false)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(false)
        return true
    }
}
