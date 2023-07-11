# ios-native-ad

dwq

## Install

```bash
npm install ios-native-ad
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`loadNativeAd(...)`](#loadnativead)
* [`triggerNativeAd(...)`](#triggernativead)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### loadNativeAd(...)

```typescript
loadNativeAd(options: AdOptions) => Promise<NativeAdResult>
```

| Param         | Type                                            |
| ------------- | ----------------------------------------------- |
| **`options`** | <code><a href="#adoptions">AdOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#nativeadresult">NativeAdResult</a>&gt;</code>

--------------------


### triggerNativeAd(...)

```typescript
triggerNativeAd(options: TriggerAdOptions) => Promise<void>
```

| Param         | Type                                                          |
| ------------- | ------------------------------------------------------------- |
| **`options`** | <code><a href="#triggeradoptions">TriggerAdOptions</a></code> |

--------------------


### Interfaces


#### NativeAdResult

| Prop      | Type               |
| --------- | ------------------ |
| **`ads`** | <code>any[]</code> |


#### AdOptions

| Prop            | Type                 |
| --------------- | -------------------- |
| **`adId`**      | <code>string</code>  |
| **`isTesting`** | <code>boolean</code> |
| **`adsCount`**  | <code>number</code>  |


#### TriggerAdOptions

| Prop     | Type                |
| -------- | ------------------- |
| **`id`** | <code>string</code> |

</docgen-api>
