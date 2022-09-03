//
//  SettingsController.swift
//  CurrencyCourses
//
//  Created by Алекс Смык on 10.06.22.
//

import UIKit

class SettingsController: UIViewController {

    @IBAction func pushCancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func pushShowCurrencies(_ sender: Any) {
        Model.shared.loadXMLFile(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
