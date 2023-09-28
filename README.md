# AllTooValidatorSwift
[![Version](https://img.shields.io/cocoapods/v/AllTooValidatorSwift.svg?style=flat)](https://cocoapods.org/pods/AllTooValidatorSwift)
[![License](https://img.shields.io/cocoapods/l/AllTooValidatorSwift.svg?style=flat)](https://cocoapods.org/pods/AllTooValidatorSwift)
[![Platform](https://img.shields.io/cocoapods/p/AllTooValidatorSwift.svg?style=flat)](https://cocoapods.org/pods/AllTooValidatorSwift)

Validator using the Chain of Responsibility pattern.
This is a Swift validator that uses the Chain of Responsibility pattern to add validations for inputs or other values.

<img src="https://github.com/nowjordanhappy/AllTooValidatorSwift/blob/main/alltoovaldiation-demo.gif" width="300px">

## How to Use
- **Basic Validator**

  This library includes basic validators like:

  | Name                | Description                              |
  | ------------------- | ---------------------------------------- |
  | MinLengthValidator  | Checks the minimum length of a string   |
  | MaxLengthValidator  | Checks the maximum length of a string   |
  | EqualsLengthValidator | Checks if the length of a string is equal to a value |
  | EmptyValidator      | A shortcut to check if a string is empty |
  | MinValueValidator   | Use this validation for minimum value; this type should be comparable (e.g., int, double, etc.) |

  Usage:

    ```swift
    //***** Using Validator Only ******
    // Validate identification number (8 characters)
    let identificationNumber = identificationDocumentFT.text ?? ""
    let identificationNumberValidator = EqualsLengthValidator(expectedLength: 8, error: AllTooValidatorError.validationFailed("Identification number should be 8 characters"))
    let identificationNumberResult = identificationNumberValidator.validate(data: identificationNumber)
    ```

- **String Builder Validator**

  The `StringValidatorBuilder` helps to add multiple validations at the same time. It stops when one validation fails, so the order is important:

    ```swift
    // Validate phone number
    // 9-11 characters
    let phone = phoneTF.text ?? ""
    // Using a builder
    let phoneValidator = StringValidatorBuilder()
        .addValidator(EmptyValidator(error: AllTooValidatorError.validationFailed("Enter your phone")))
        .addValidator(MinLengthValidator(minLength: 9, error: AllTooValidatorError.validationFailed("Phone should be 9 to 11 characters")))
        .addValidator(MaxLengthValidator(maxLength: 11, error: AllTooValidatorError.validationFailed("Phone should be 9 to 11 characters")))
        .build()
    let phoneResult = phoneValidator.validate(data: phone)
    ```

- **Custom Validator**

  For this, we use `AdultAgeValidator`. To create a custom validator, it should extend from `AllTooValidator` and specify the input and output types. In this case, we use a string as input and return an integer value.

    ```swift
    class AdultAgeValidator: AllTooValidator {
        func validate(data: String) -> AllTooValidatorResult<Int> {
            let emptyValidator = EmptyValidator(error: AllTooValidatorError.validationFailed("Enter your age"))
            let emptyValidationResult = emptyValidator.validate(data: data)
            
            if case let .failure(error) = emptyValidationResult {
                return .failure(error: error)
            }
            
            if let age = Int(data) {
                let minValueValidator = MinValueValidator(minValue: 18, error: AllTooValidatorError.validationFailed("Your age should be equal or greather than 18"))
                return minValueValidator.validate(data: age)
            } else {
                return .failure(error: AllTooValidatorError.validationFailed("Invalid age, enter again"))
            }
        }
    }
    ```

## Check validation

To check if the validation fails, we show check using the AllTooValidatorResult, in case of success we can we the value, and for failure, we get the errorMessageResId:

```swift
public enum AllTooValidatorResult<T> {
    case success(T)
    case failure(error: Error)
}
```

And for checking we could do this:

```swift
let ageResult = ageValidator.validate(data: age)

switch ageResult {
    case .success(let validatedData):
        print("Validation passed. Validated data as Int: \(validatedData)")
        yearsOldError.isHidden = true
    case .failure(let error):
        print("An unknown error occurred: \(error.localizedDescription)")
        yearsOldError.isHidden = false
        yearsOldError.text = error.localizedDescription
}
```

## Requirements

* Xcode 10.0+
* Swift 5+
* iOS 9.3+

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

AllTooValidatorSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AllTooValidatorSwift'
```

## Extras
* If you want to create your custom builder, use **CompositeValidator** and **AnyAllTooValidator** to connect the validators with the **AllTooValidator** protocol.
* Use **AllTooValidator** for create your own validator. You need to specify the enter and ouput type, they can be different.

## Other platforms
* Android: [AllTooValidator](https://github.com/nowjordanhappy)

## License

MIT License

Copyright (c) 2023 Jordan R. A.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER  
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  
SOFTWARE.
