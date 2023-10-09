#  SISwift

## Intro

When I first started development with macOS, I often needed to access system information like the cpu architecture, system memory usage, and so on. I haven't found simple way to access this data using Swift, so I initially created a Wrapper for some C code, that allowed my to monitor the system. SISwift introduces a simple way to access system information using Swift.

Features:

- ✔️ CPU Architecture
- ✔️ CPU Usage
- ✔️ Memory Usage
- ✔️ Disk Usage
- ✔️ Simple API
- ✔️ Works on Intel and Apple Silicon Macs
- ✔️ Works on macOS 10.15 and above

## Installation

[Swift Package Manager](https://swift.org/package-manager/) is the simplest way to install for Xcode projects. Simply add the following Package Dependency:

```
https://github.com/dan-koller/SISwift
```

## Usage

```swift
import SISwift

/*
* CPU Architecture is a String that can be:
* - x86_64
* - arm64
*/

// Get CPU Architecture
let cpuArch: String = SISystemInfo.getArchitecture()

/*
* CPU Usage, Memory Usage and Disk Usage are all Floats between 0 and 1
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

## License

SISwift is licensed under the MIT License. See [LICENSE](LICENSE) for more information.
