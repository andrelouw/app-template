import SwiftUI
import UIKit

public final class WelcomeViewController: UIHostingController<WelcomeView> {
  public init(appName: String) {
    super.init(rootView: WelcomeView(appName: appName))
  }

  @available(*, unavailable)
  required dynamic init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
