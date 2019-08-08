//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by HaroldDavidson on 8/1/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit
import WebKit

class AuthorViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlPath = Bundle.main.path(forResource: "AboutTheAuthor", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

}
