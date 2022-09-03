//
//  addCity.swift
//  Weather
//
//  Created by Алекс Смык on 17.08.22.
//

import UIKit

extension UIViewController {
    
    func alertAddCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void){
        
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .default) { action in
            let textFieldAction = alertController.textFields?.first
            guard let text = textFieldAction?.text else {
                return
            }
            completionHandler(text)
        }
        alertController.addTextField { textField in
            textField.placeholder = placeholder
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { _ in
            
        }
        
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
}

