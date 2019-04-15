//
//  OverviewController.swift
//  RWStore
//
//  Created by admin on 2019/4/15.
//  Copyright © 2019 raymond. All rights reserved.
//

import Cocoa

class OverviewController: NSViewController {

    @IBOutlet weak var productImageView: NSImageView!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var titleLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        numberFormatter.numberStyle = .currency
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }

    //1
    let numberFormatter = NumberFormatter()
    //2
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    private func updateUI() {
        //1
        if isViewLoaded {
            //2
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                priceLabel.stringValue = numberFormatter.string(from: product.price) ?? "n/a"
                descriptionLabel.stringValue = product.descriptionText
            }
        }
    }
    
}
