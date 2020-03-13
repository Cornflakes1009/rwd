import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  
  let duration = 0.8
  var presenting = true
  var origingFrame = CGRect.zero
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    // complete transition - commenting out to add a better transition effect
//    let containerView = transitionContext.containerView
//    let toView = transitionContext.view(forKey: .to)!
//
//    containerView.addSubview(toView)
//    toView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
//    UIView.animate(
//      withDuration: duration,
//      animations: {
//        toView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//    },
//      completion: { _ in
//        transitionContext.completeTransition(true)
//    }
//    )
    
    let containerView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    let recipeView = presenting ? toView : transitionContext.view(forKey: .from)!

    let initialFrame = presenting ? origingFrame : recipeView.frame
    let finalFrame = presenting ? recipeView.frame : origingFrame

    let xScaleFactor = presenting ?
    initialFrame.width / finalFrame.width :
    finalFrame.width / initialFrame.width
    
    
  }
}
