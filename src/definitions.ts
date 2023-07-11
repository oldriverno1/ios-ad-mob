export interface IosNativeAdPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
