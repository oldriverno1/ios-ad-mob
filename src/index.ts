import { registerPlugin } from '@capacitor/core';

import type { IosNativeAdPlugin } from './definitions';

const IosNativeAd = registerPlugin<IosNativeAdPlugin>('IosNativeAd', {
  web: () => import('./web').then(m => new m.IosNativeAdWeb()),
});

export * from './definitions';
export { IosNativeAd };
