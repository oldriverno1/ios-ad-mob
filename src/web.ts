import { WebPlugin } from '@capacitor/core';

import type {
  AdOptions,
  IosNativeAdPlugin,
  NativeAdResult,
  TriggerAdOptions,
} from './definitions';

export class IosNativeAdWeb extends WebPlugin implements IosNativeAdPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  loadNativeAd(options: AdOptions): Promise<NativeAdResult> {
    console.log(options);
    return Promise.resolve({ ads: [] });
  }
  triggerNativeAd(options: TriggerAdOptions): Promise<void> {
    console.log(options);

    return Promise.resolve();
  }
}
