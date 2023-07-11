import { WebPlugin } from '@capacitor/core';

import type { IosNativeAdPlugin } from './definitions';

export class IosNativeAdWeb extends WebPlugin implements IosNativeAdPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
