//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by HaroldDavidson on 8/25/19.
//  Copyright © 2019 HaroldDavidson. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // making textField to become the first responder so that the user doesn't have to click on the text field and this brings the keyboard up. 
        textField.becomeFirstResponder()
    }
    
    // added so that when clicking on the label, only the label gets selected and not the whole cell
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}

extension AddItemTableViewController: UITextFieldDelegate {
    // added so that when tapping done on the keyboard the keyboard dismisses
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    // getting value of textField and enabling Add button if text (not sure why it's so complicated?). Will enable Add button if text is present and disable if you delete the text.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
              let stringRange = Range(range, in: oldText) else {
                return false
        }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
