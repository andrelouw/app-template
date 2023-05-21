import UIKit
import SwiftUI

public final class WelcomeViewController: UIHostingController<WelcomeView> {
  public init(appName: String) {
    super.init(rootView: WelcomeView(appName: appName))
  }

  @available(*, unavailable)
  required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
