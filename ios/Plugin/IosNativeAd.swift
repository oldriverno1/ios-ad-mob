import Foundation
import GoogleMobileAds

class IosNativeAd : NSObject, GADNativeAdLoaderDelegate, GADNativeAdDelegate {

    private var nativeAds: [GADNativeAd] = []
    private var nativeAdView: GADNativeAdView?

    func echo(_ value: String) -> String {
        return value
    }

    func loadNativeAd(adId: String, isTestAd: Bool, adsCount: Int, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        let adUnitID = isTestAd ? "ca-app-pub-3940256099942544/3986624511" : adId
        let adLoader = GADAdLoader(adUnitID: adUnitID, rootViewController: nil, adTypes: [ .native ], options: nil)
        adLoader.delegate = self
        adLoader.load(GADRequest())
        // After the ads have loaded, extract info and call the completion handler
        let adsData = nativeAds.map { extractAdInfo($0) }
        completion(adsData, nil)
    }

    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("Ad failed to load with error: \(error.localizedDescription)")
    }

    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        // Save the native ad for later.
        self.nativeAds.append(nativeAd)

        // Create and place ad in view hierarchy.
        let nativeAdView = GADNativeAdView(frame: CGRect(x: 0, y: 0, width: 300, height: 250)) // Set your own frame
        nativeAd.delegate = self // Set the delegate to receive click notifications
        nativeAdView.nativeAd = nativeAd
        self.nativeAdView = nativeAdView // Store this view for later
    }

    // GADNativeAdDelegate
    func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
        print("Native ad was clicked.")
    }

    // Extract relevant ad info into a dictionary
    private func extractAdInfo(_ nativeAd: GADNativeAd) -> [String: Any] {
        var adInfo: [String: Any] = [:]
        adInfo["headline"] = nativeAd.headline
        adInfo["callToAction"] = nativeAd.callToAction
        adInfo["body"] = nativeAd.body
        adInfo["starRating"] = nativeAd.starRating
        adInfo["store"] = nativeAd.store
        adInfo["price"] = nativeAd.price
        adInfo["advertiser"] = nativeAd.advertiser
        // Convert GADNativeAdImage to Data for easier handling on JS side
        if let icon = nativeAd.icon {
            let iconImage = icon.image ?? UIImage()
            let iconData = iconImage.pngData() ?? Data()
            adInfo["icon"] = iconData.base64EncodedString()
        }

        return adInfo
    }

}
