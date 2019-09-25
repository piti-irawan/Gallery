//
//  GalleryScrollViewController.swift
//  Gallery
//
//  Created by Piti Irawan on 2019/09/25.
//  Copyright © 2019 Piti Irawan. All rights reserved.
//

import UIKit

class GalleryScrollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewForZooming: UIImageView!
    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 5.0
        scrollView.zoomScale = 1.0
        viewForZooming.image = image
        viewForZooming.frame = CGRect(origin: CGPoint.zero, size: image.size)
        scrollView.contentSize = image.size
        scrollViewWidth.constant = image.size.width
        scrollViewHeight.constant = image.size.height
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollViewWidth.constant = scrollView.contentSize.width
        scrollViewHeight.constant = scrollView.contentSize.height
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return viewForZooming
    }
}
