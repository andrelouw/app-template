import SwiftUI
import UI

public struct WelcomeView: View {
  var appName: String

  public var body: some View {
    ZStack {
      Color.brand.secondary
        .ignoresSafeArea()
      VStack {
        Text(WelcomeStrings.welcomeMessage)
          .font(.headline)
          .foregroundColor(.font.primary)
        Text(appName)
          .font(.largeTitle)
          .foregroundColor(.font.secondary)
      }
      .offset(y: -100)
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(appName: "MyApp")
  }
}
