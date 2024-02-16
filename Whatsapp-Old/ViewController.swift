//
//  ViewController.swift
//  Whatsapp-Old
//
//  Created by David Empire on 2/15/24.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        loadURL()
    }

    func loadURL() {
        if let url = URL(string: "https://web.whatsapp.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // Override this method to handle keyDown events
    override func keyDown(with event: NSEvent) {
        // Check if the 'r' key is pressed
        if event.charactersIgnoringModifiers == "r" {
            // Call the reload method on your webView to refresh it
            webView.reload()
        } else {
            // If it's not the 'r' key, call the super's implementation
            super.keyDown(with: event)
        }
    }
    
    // This function is necessary to allow your view to become first responder
    // and receive key events
    override var acceptsFirstResponder: Bool {
        return true
    }
}
