//
//  SISystemInfo.swift
//  
//
//  Created by Daniel Koller on 08.10.23.
//

import Foundation
import SystemInfo

protocol SystemInfoInterface {
    static func getArchitecture() -> String
    static func getCpuLoad() -> Float
    static func getMemoryUsage() -> Float
    static func getDiskUsage() -> Float
    static func printSystemInfo()
}

/// `SISwift` stands for `SystemInfoSwift` and provides a
/// handy package with a set of tools to monitor macOS.
/// `SISystemInfo` is a collection of static methods to retreive
/// certain information about the current system. You don't need to
/// create an object and can call the member methods directly.
///
/// ```
/// // Example:
/// import SISwift
///
/// SISystemInfo.getArchitecture() // "x86_64"
/// ```
///
/// > Warning: The member methods won't throw any errors in case
/// > they are unable to get certain data. They rather return a default
/// > value such as "`Unknown <parameter>`" for strings and
/// > "`-1.0f`" for decimal (float) values.
public class SISystemInfo : SystemInfoInterface {
    
    /// Get the cpu architecture of your system as string.
    ///
    /// ```
    /// SISystemInfo.getArchitecture() // "x86_64"
    /// ```
    ///
    /// > Warning: If for some reason the method fails to retreive
    /// > a valid architecture, it won't throw an error but rather
    /// > returns the string `Unknown Architecture`.
    ///
    /// - Returns: The current system cpu architecture.
    public static func getArchitecture() -> String {
        guard let cpuArchitecture = getCPUArchitecture() else {
            return "Unknown architecture"
        }
        let arch = String(cString: cpuArchitecture)
        free(UnsafeMutablePointer(mutating: cpuArchitecture))
        return arch
    }
    
    /// Get the current cpu utilization as a float value between 1.0f for
    /// "CPU fully pinned", 0.0f for "CPU idle", or somewhere in between.
    ///
    /// ```
    /// SISystemInfo.getCpuLoad() // 0.46153843
    /// ```
    ///
    /// > Warning: If the method fails to retreive the cpu load, the value
    /// > `-1.0f` is returned instead.
    ///
    /// - Returns: The current system cpu utilization.
    public static func getCpuLoad() -> Float {
        let cpuLoad = SystemInfo.getCPULoad()
        return cpuLoad
    }
    
    /// Get the current system memory usage  as a float value between 0.0f and 1.0f,
    /// with 0.0f meaning all RAM is available, and 1.0f meaning all RAM is currently
    /// in use.
    ///
    /// ```
    /// SISystemInfo.getMemoryUsage() // 0.62846607
    /// ```
    ///
    /// > Warning: If the method fails to retreive the memory usage, the value
    /// > `-1.0f` is returned instead.
    ///
    /// - Returns: The current system memory usage.
    public static func getMemoryUsage() -> Float {
        let memoryUsage = SystemInfo.getSystemMemoryUsage()
        return memoryUsage
    }
    
    /// Get the current `main` disk usage  as a float value between 0.0f and 1.0f,
    /// with 0.0f meaning all disk space is available, and 1.0f meaning all disk space
    /// is currently in use. `main` in this context means the disk, macOS currently
    /// runs on. Network drives or other internal drives are ignored.
    ///
    /// ```
    /// SISystemInfo.getDiskUsage() // 0.6509177
    /// ```
    ///
    /// > Warning: If the method fails to retreive the disk usage, the value
    /// > `-1.0f` is returned instead.
    ///
    /// - Returns: The current disk usage factor.
    public static func getDiskUsage() -> Float {
        let diskUsage = SystemInfo.getDiskUsage()
        return diskUsage
    }
    
    /// Prints a basic system overview to the standard output.
    ///
    /// ```
    /// SISystemInfo.printSystemInfo()
    /// ```
    ///
    /// ```
    /// // Output:
    /// CPU Architecture: x86_64
    /// CPU Usage:: 47.37
    /// Memory Usage:: 63.42
    /// Disk Usage:: 65.10
    /// ```
    public static func printSystemInfo() {
        func printInfo(_ label: String, value: Float?, unit: String = "%") {
            if let value = value {
                print("\(label): \(String(format: "%.2f\(unit)", value * 100.0))")
            } else {
                print("Failed to retrieve \(label.lowercased())")
            }
        }

        let cpuArchitecture = getArchitecture()
        print("CPU Architecture: \(cpuArchitecture)")

        printInfo("CPU Usage:", value: getCpuLoad())
        printInfo("Memory Usage:", value: getMemoryUsage())
        printInfo("Disk Usage:", value: getDiskUsage())
    }

}
