//
//  ViewController.swift
//  RWStore
//
//  Created by admin on 2019/4/15.
//  Copyright © 2019 raymond. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    private var products = [Product]()
    var selectedProduct: Product?
    private var overviewViewController: OverviewController?
    private var detailViewController: DetailViewController?

    @IBOutlet weak var productsButton: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let filePath = Bundle.main.path(forResource: "Products", ofType: "plist") {
            products = Product.productsList(filePath)
        }
        //1
        productsButton.removeAllItems()
        //2
        for product in products {
            productsButton.addItem(withTitle: product.title)
        }
        //3
        selectedProduct = products[0]
        productsButton.selectItem(at: 0)


    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func valueChanged(_ sender: NSPopUpButton) {
        if let bookTitle = sender.selectedItem?.title,
            let index = products.index(where: {$0.title == bookTitle}) {
            selectedProduct = products[index]
            overviewViewController?.selectedProduct = selectedProduct

        }
        detailViewController?.selectedProduct = selectedProduct


    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        guard let tabViewController = segue.destinationController
            as? NSTabViewController else { return }
        
        for controller in tabViewController.childViewControllers {
            
            if let controller = controller as? OverviewController {
                overviewViewController = controller
                overviewViewController?.selectedProduct = selectedProduct
            }
            else if let controller = controller as? DetailViewController {
                detailViewController = controller
                detailViewController?.selectedProduct = selectedProduct
            }

        }
    }

    
}

