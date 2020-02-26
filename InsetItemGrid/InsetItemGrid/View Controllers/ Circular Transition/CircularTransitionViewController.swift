//
//  CircularTransitionViewController.swift
//  InsetItemGrid
//
//  Created by s on 2/25/20.
//  Copyright © 2020 s. All rights reserved.
//

import UIKit

class CircularTransitionViewController: UIViewController {

    @IBOutlet weak var vButton: UIButton!
    let transition = CircularTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        vButton.layer.cornerRadius = vButton.frame.size.width / 2
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? TransitionToViewController else { return }
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
    }
}

extension CircularTransitionViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = vButton.center
        transition.circleColor = vButton.backgroundColor!
        return transition

    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = vButton.center
        transition.circleColor = vButton.backgroundColor!

        return transition
    }
}

