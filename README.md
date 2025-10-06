# Fxapi (CocoaPods)

- Website: https://fxapi.com
- Docs: https://fxapi.com/docs/

## Installation
```ruby
pod 'Fxapi', :git => 'https://github.com/martechdev/fxapi-ios.git', :tag => '0.1.0'
```

## Usage
```swift
import Fxapi
let client = FxApiClient(configuration: .init(apiKey: "YOUR_API_KEY"))
let latest = try await client.latest(["base": "USD", "symbols": "EUR,GBP"]) 
```
