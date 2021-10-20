//
//  ViewController.swift
//  CADisplayLink
//
//  Created by vishwanath kota on 20/10/2021.
//

import UIKit

class ViewController: UIViewController {

    let countLabel: UILabel = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.isUserInteractionEnabled = true
        label.textColor = .white
        label.backgroundColor = .orange
        return label
    }()
    var startValue: Double = 500
    let endValue: Double = 1000
    let animationDuration: Double = 10
    
    let animationStartDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(countLabel)
        countLabel.frame = view.frame
        /*
        //Updating labels doesnt work with the UIAnimations we need to use CADisplayLink
        UIView.animate(withDuration: 2.5) {
            self.countLabel.text = "990909"
        }
        */
        
//        let oneTap = UITapGestureRecognizer(target: self, action: #selector(didTapped))
//        oneTap.numberOfTapsRequired = 1
//        countLabel.addGestureRecognizer(oneTap)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
        
    }
    
    @objc func didTapped() {
        //Create my CADisplayLink it works with 60frames for second
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    

    @objc func handleUpdate() {
        /*
        print(Date())
        let seconds = Date().timeIntervalSince1970
        self.countLabel.text = "\(seconds)"
         */
        /*
        self.countLabel.text = "\(startValue)"
        startValue += 1
        
        if (startValue > endValue) {
            startValue = endValue
        }
         */
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
//        self.countLabel.text = "\(elapsedTime)"
        if elapsedTime > animationDuration {
            self.countLabel.text = "\(endValue)"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = startValue + percentage * (endValue - startValue)
            self.countLabel.text = "\(value)"
        }
    }

}

