//
//  ChecklistItem.swift
//  Checklist
//
//  Created by HaroldDavidson on 8/24/19.
//  Copyright © 2019 HaroldDavidson. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
