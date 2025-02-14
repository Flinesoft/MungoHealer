#if os(iOS) || os(tvOS)
import UIKit

extension UIWindow {
  var topViewController: UIViewController {
    return topViewController(in: rootViewController!)
  }
  
  private func topViewController(in viewCtrl: UIViewController) -> UIViewController {
    guard let presentedViewCtrl = viewCtrl.presentedViewController else { return viewCtrl }
    guard let navigationCtrl = presentedViewCtrl as? UINavigationController else { return topViewController(in: presentedViewCtrl) }
    return topViewController(in: navigationCtrl.viewControllers.last!)
  }
}
#endif
