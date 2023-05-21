import SwiftUI

public struct WelcomeView: View {
  var appName: String

  public var body: some View {
    ZStack {
      WelcomeAsset.brandPrimary.swiftUIColor
        .ignoresSafeArea()
      VStack {
        Text(WelcomeStrings.welcomeMessage)
          .font(.headline)
          .foregroundColor(WelcomeAsset.fontSecondary.swiftUIColor)
        Text(appName)
          .font(.largeTitle)
          .foregroundColor(WelcomeAsset.fontPrimary.swiftUIColor)
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
