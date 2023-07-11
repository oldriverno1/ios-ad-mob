import Foundation
import Capacitor
import GoogleMobileAds

@objc(IosNativeAdPlugin)
public class IosNativeAdPlugin: CAPPlugin {
    private let implementation = IosNativeAd()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func loadNativeAd(_ call: CAPPluginCall) {
        let adId = call.getString("adId") ?? ""
        let isTestAd = call.getBool("isTesting") ?? false
        let adsCount = call.getInt("adsCount") ?? 1
        let adsCountAdjusted = max(min(adsCount, 5), 1)

        implementation.loadNativeAd(adId: adId, isTestAd: isTestAd, adsCount: adsCountAdjusted) { (error) in
            if let error = error {
                call.reject("Ad failed to load \(error.localizedDescription)")
            } else {
                call.resolve(["ads": adsData])
            }
        }
    }

    // Remove this part since it's not being used
    //@objc func triggerNativeAd(_ call: CAPPluginCall) {
    //    guard let id = call.getString("id") else {
    //        call.reject("ID not provided")
    //        return
    //    }

    //    implementation.triggerNativeAd(withId: id)
    //    call.resolve()
    //}
}
