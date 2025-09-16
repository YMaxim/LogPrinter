<p align="center">
<img src="https://github.com/YMaxim/LogPrinter/blob/main/Images/logo.png" alt="LogPrinter" title="LogPrinter" width="400"/>
</p>

<p align="center">
<a href="https://swift.org" target="_blank"><img src="https://img.shields.io/badge/Language-Swift%205,%206-orange.svg" alt="Language Swift 5, 6"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>
<a href="https://github.com/YMaxim/LogPrinter/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-black"></a>
</p>


**LogPrinter**: a lightweight and structured Xcode logger
<p align="left">
<img src="https://github.com/YMaxim/LogPrinter/blob/main/Images/example_1.png" alt="example_1" title="example_1"/>
</p>


### How to get started
```Swift
let log = Printer()
log.debug("App launched", category: .appLifecycle)
```
<p align="left">
<img src="https://github.com/YMaxim/LogPrinter/blob/main/Images/example_3.png" alt="example_3" title="example_3"/>
</p>


### Example of a network logging
```Swift
log.debug("Subscription status validated", category: .api(.success))
log.warning("CategoryID doesn't exist", category: .api(.info))
log.error("User update completed with an error: \(error.localizedDescription)", category: .api(.error))
```
<p align="left">
<img src="https://github.com/YMaxim/LogPrinter/blob/main/Images/example_4.png" alt="example_4" title="example_4"/>
</p>

### License
LogPrinter is released under the MIT license. See LICENSE for details.

#### More information in the Medium publication:

https://medium.com/@maxwellios/logprinter-a-lightweight-and-structured-xcode-logger-5cf35170a1be
