//
//  TextFieldTableViewCell.swift
//  Gallery
//
//  Created by Piti Irawan on 2019/09/25.
//  Copyright © 2019 Piti Irawan. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // Set galleries[section][row].
        textField.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
