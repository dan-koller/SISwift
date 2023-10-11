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

public class SISwift : SystemInfoInterface {
    
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
    
    public static func getCpuLoad() -> Float {
        let cpuLoad = SystemInfo.getCPULoad()
        return cpuLoad
    }
    
    public static func getMemoryUsage() -> Float {
        let memoryUsage = SystemInfo.getSystemMemoryUsage()
        return memoryUsage
    }
    
    public static func getDiskUsage() -> Float {
        let diskUsage = SystemInfo.getDiskUsage()
        return diskUsage
    }
    
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
        printInfo("Memory Usage:", value: SISystemInfo.getMemoryUsage())
        printInfo("Disk Usage:", value: getDiskUsage())
    }

}
