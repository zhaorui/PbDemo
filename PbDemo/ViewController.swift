//
//  ViewController.swift
//  PbDemo
//
//  Created by 赵睿 on 15/2/17.
//  Copyright © 2017年 赵睿. All rights reserved.
//

import Cocoa

let kPublicUrl = "public.url"
let kPublicUrlName = "public.url-name"

class ViewController: NSViewController {
    
  @IBOutlet var textView: NSTextView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func copyToClipboard(_ sender: NSButton) {
        guard let content = textView.string else { return }
        let pb = NSPasteboard.general()
        pb.clearContents()
        pb.writeObjects([content as NSString])
    }

    @IBAction func showClipboardContent(_ sender: NSButton) {
        let pb = NSPasteboard.general()
        
        for item in pb.pasteboardItems ?? [] {
            if let str = item.string(forType: kPublicUrl) {
                textView.string = "url: \(str)"
            } else if let str = item.string(forType: kPublicUrlName) {
                textView.string = "url name: \(str)"
            } else {
                let str = item.string(forType: NSPasteboardTypeString)
                textView.string = str
            }
        }
    }
}

