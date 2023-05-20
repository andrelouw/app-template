import SwiftUI

struct MainView: View {
  var body: some View {
    ZStack {
      MyAppAsset.brandPrimary.swiftUIColor
        .ignoresSafeArea()
      VStack {
        Text(MyAppStrings.welcomeMessage)
          .font(.headline)
          .foregroundColor(MyAppAsset.fontSecondary.swiftUIColor)
        Text(Bundle.main.displayName ?? "App")
          .font(.largeTitle)
          .foregroundColor(MyAppAsset.fontPrimary.swiftUIColor)
      }
      .offset(y: -100)
    }
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: - Private extensions -

// MARK: - Bundle
private extension Bundle {
  // Name of the app - title under the icon.
  var displayName: String? {
    return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey: "CFBundleName") as? String
  }
}
