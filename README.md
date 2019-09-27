# AlamofireSoap

[![CI Status](https://img.shields.io/travis/ShakeebM/AlamofireSoap.svg?style=flat)](https://www.travis-ci.org/ShakeebM/AlamofireSoap)
[![Version](https://img.shields.io/cocoapods/v/AlamofireSoap.svg?style=flat)](https://cocoapods.org/pods/AlamofireSoap)
[![License](https://img.shields.io/cocoapods/l/AlamofireSoap.svg?style=flat)](https://cocoapods.org/pods/AlamofireSoap)
[![Platform](https://img.shields.io/cocoapods/p/AlamofireSoap.svg?style=flat)](https://cocoapods.org/pods/AlamofireSoap)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Xcode 10.0 or later with Swift 5.0

## Installation

AlamofireSoap is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AlamofireSoap'
```
## Usage

### Making a Request

```swift
import AlamofireSoap

AlamofireSoap.soapRequest("http://www.dneonline.com/calculator.asmx", soapmethod: "Add", soapparameters: ["intA":"1","IntB":"2"], namespace: "http://tempuri.org")
```

### Response Handling

Handling the `Response` of a `Request` made in Alamofire involves chaining a response handler onto the `Request`.

```swift
AlamofireSoap.soapRequest("http://www.dneonline.com/calculator.asmx", soapmethod: "Add", soapparameters: ["intA":"1","IntB":"2"], namespace: "http://tempuri.org").responseString { response in
print("Request: \(response.value))   // original url request
```
## Author

Shakeeb Mancheri, shakeeb818@gmail.com

## License

AlamofireSoap is available under the MIT license. See the LICENSE file for more info.
