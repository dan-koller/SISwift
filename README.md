# SISwift

A Swift package that allows you to easily access system information like CPU Architecture, CPU Usage, Memory Usage, Disk Usage and many more on macOS.

[![Swift](https://img.shields.io/badge/Swift-5.3-orange.svg)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://swift.org/package-manager)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Intro

When I first started development with macOS, I often needed to access system information like the cpu architecture, system memory usage, and so on. I haven't found simple way to access this data using Swift, so I initially created a Wrapper for some C code, that allowed me to monitor the system. SISwift now introduces a simple way to access system information using Swift.

Features:

-   ✔️ CPU Architecture
-   ✔️ CPU Usage
-   ✔️ Memory Usage
-   ✔️ Disk Usage
-   ✔️ Simple API
-   ✔️ Works on Intel and Apple Silicon Macs
-   ✔️ Works on macOS 10.15 and above

... and many more functions. Check out the [documentation](Docs/Documentation.md) for more information.

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Installation

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is the simplest way to install for Xcode projects. Simply add the following Package Dependency:

```
https://github.com/dan-koller/SISwift
```

### Carthage

Include this line in your `Cartfile`:

```
github "dan-koller/SISwift"
```

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## Usage

I hope it is pretty self-explanatory. If you have any questions, feel free to open an issue. Here are some examples:

```swift
import SISwift

/*
* CPU Architecture is a string that can be:
* - x86_64
* - arm64
*/

// Get CPU Architecture
let cpuArch: String = SISystemInfo.getArchitecture()

/*
* CPU Usage, Memory Usage and Disk Usage are all floats between 0 and 1
* 0 = 0%
* 1 = 100%
*/

// Get CPU Usage
let cpuUsage: Float = SISystemInfo.getCpuLoad()

// Get Memory Usage
let memoryUsage: Float = SISystemInfo.getMemoryUsage()

// Get Disk Usage
let diskUsage: Float = SISystemInfo.getDiskUsage()

// Just print the system info
SISystemInfo.printSystemInfo()
```

<img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/solar.png">

## License

SISwift is licensed under the MIT License. See [LICENSE](LICENSE) for more information.
