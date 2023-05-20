import UIKit
import SwiftUI

final class MainViewController: UIHostingController<MainView> {
  init() {
    super.init(rootView: MainView())
  }

  @available(*, unavailable)
  required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
