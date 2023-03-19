//
//  main.swift
//  scrollscale
//
//  Created by Dmitiy Myachin on 19.03.2023.
//
import UIKit

class SwipeViewController: UIViewController, UIScrollViewDelegate {
    lazy var scroll:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: self.view.frame.width, height: 1800)
        view.backgroundColor = .systemBackground
        view.delegate = self
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "coffee")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .red
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scroll)
        scroll.frame = view.frame
        
        scroll.addSubview(imageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.contentOffset.y <= -scroll.safeAreaInsets.top else { return }
            imageView.frame = .init(x: 0, y: scrollView.contentOffset.y, width: scroll.frame.width, height: 270 - scrollView.contentOffset.y)

            scroll.scrollIndicatorInsets = .init(top: scroll.convert(imageView.frame, to: view).height - scroll.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
    }
}

