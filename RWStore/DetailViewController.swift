//
//  DetailViewController.swift
//  RWStore
//
//  Created by admin on 2019/4/15.
//  Copyright © 2019 raymond. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var audienceLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var productImageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    // 1
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    // 2
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
    // 3
    private func updateUI() {
        if isViewLoaded {
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                descriptionLabel.stringValue = product.descriptionText
                audienceLabel.stringValue = product.audience
            }
        }
    }

}
