//
//  ViewController.swift
//  ISpy
//
//  Created by Colin Erickson on 10/12/23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateZoomFor(size: view.bounds.size)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = scale
    }
    
}

