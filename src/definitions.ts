export interface AdOptions {
  adId: string;
  isTesting: boolean;
  adsCount: number;
}

export interface NativeAdResult {
  ads: any[];
}

export interface TriggerAdOptions {
  id: string;
}

export interface IosNativeAdPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  loadNativeAd(options: AdOptions): Promise<NativeAdResult>;
  triggerNativeAd(options: TriggerAdOptions): Promise<void>;
}
