# SISwift - Documentation

## Table of Contents

-   [Introduction](#introduction)
-   [Installation](#installation)
-   [Usage](#usage)
-   [License](#license)

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Introduction

SISwift is a Swift library for interacting with some low-level macOS APIs. It is meant to be a simple and easy-to-use library for obtaining information about the system and requires no knowledge of Objective-C or C.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Installation

### Swift Package Manager

The fastest way to install SISwift is by adding the dependency to your project using Swift Package Manager. To do this, open your project in Xcode and navigate to `File > Swift Packages > Add Package Dependency...`. Then, enter the following URL:

```
https://github.com/dan-koller/SISwift
```

### Carthage

You can also install SISwift by adding the following line to your `Cartfile`:

```
github "dan-koller/SISwift"
```

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Usage

### Importing the Library

```swift
import SISwift
```

### Getting the system architecture

```swift
let arch: String = SISystemInfo.getArchitecture() // "x86_64" or "arm64"
```

### Getting the system model

```swift
let model: String = SISystemInfo.getModelName() // "MacBookPro15,4"
```

### Getting the OS version

```swift
let version: String = SISystemInfo.getOsVersion() // "13.5.2"
```

### Getting the OS name

```swift
let name: String = SISystemInfo.getOsName() // "macOS"
```

### Getting the Kernel name

```swift
let kernel: String = SISystemInfo.getKernelName() // "Darwin"
```

### Getting the host name

```swift
let host: String = SISystemInfo.getHostName() // "My-MBP"
```

### Getting the current cpu load

```swift
let load: Float = SISystemInfo.getCpuLoad() // 0.0f - 1.0f
```

### Getting the current memory usage

```swift
let usage: Float = SISystemInfo.getMemoryUsage() // 0.0f - 1.0f
```

### Getting the current disk usage

```swift
let usage: Float = SISystemInfo.getDiskUsage() // 0.0f - 1.0f
```

### Printing the system information

```swift
SISystemInfo.printSystemInfo() // Prints a complete system information report
```

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## License

SISwift is licensed under the MIT license. See [LICENSE](../LICENSE) for more information.
