import XCTest
@testable import SISwift

final class SISwiftTests: XCTestCase {
    
    /*
     * Testing functions that return strings. This methods require a test for
     * empty strings and a test to verify that the returned string is valid.
     */
    
    func testArchitectureIsNotEmpty() {
        // Get the system architecture
        let architecture: String = SISystemInfo.getArchitecture()
        
        // Check that architecture is not empty
        XCTAssertFalse(architecture.isEmpty, "Architecture should not be empty.")
    }
    
    func testArchitectureIsValid() {
        // Get the system architecture
        let architecture: String = SISystemInfo.getArchitecture()
        
        // Check that architecture is valid
        XCTAssertTrue(architecture == "x86_64"
                      || architecture == "arm64",
                      "Architecture should be either x86_64 or arm64.")
    }
    
    func testHostnameIsNotEmpty() {
        // Get the hostname
        let hostname: String = SISystemInfo.getHostName()
        
        // Check that hostname is not empty
        XCTAssertFalse(hostname.isEmpty, "Hostname should not be empty.")
    }
    
    func testHostnameIsValid() {
        // Get the hostname
        let hostname: String = SISystemInfo.getHostName()
        
        // Check that hostname is valid (shouldn't be "Unknown hostname")
        XCTAssertFalse(hostname == "Unknown hostname",
                       "Hostname should not be Unknown hostname.")
    }
    
    func testModelNameIsNotEmpty() {
        // Get the model name
        let modelName: String = SISystemInfo.getModelName()
        
        // Check that model name is not empty
        XCTAssertFalse(modelName.isEmpty, "Model name should not be empty.")
    }
    
    func testModelNameIsValid() {
        // Get the model name
        let modelName: String = SISystemInfo.getModelName()
        
        // Check that model name is valid (shouldn't be "Unknown model name")
        XCTAssertFalse(modelName == "Unknown model name",
                       "Model name should not be Unknown machine name.")
    }
    
    func testOsVersionIsNotEmpty() {
        // Get the OS version
        let osVersion: String = SISystemInfo.getOsVersion()
        
        // Check that OS version is not empty
        XCTAssertFalse(osVersion.isEmpty, "OS version should not be empty.")
    }
    
    func testOsVersionIsValid() {
        // Get the OS version
        let osVersion: String = SISystemInfo.getOsVersion()
        
        // Check that OS version is valid (shouldn't be "Unknown version of macOS")
        XCTAssertFalse(osVersion == "Unknown version of macOS",
                       "OS version should not be Unknown version of macOS.")
    }
    
    func testOsNameIsNotEmpty() {
        // Get the OS name
        let osName: String = SISystemInfo.getOsName()
        
        // Check that OS name is not empty
        XCTAssertFalse(osName.isEmpty, "OS name should not be empty.")
    }
    
    func testOsNameIsValid() {
        // Get the OS name
        let osName: String = SISystemInfo.getOsName()
        
        // Check that OS name is valid (shouldn't be "Unknown name for macOS")
        XCTAssertFalse(osName == "Unknown name for macOS",
                       "OS name should not be Unknown name for macOS.")
    }

    func testKernelNameIsNotEmpty() {
        // Get the kernel name
        let kernelName: String = SISystemInfo.getKernelName()
        
        // Check that kernel name is not empty
        XCTAssertFalse(kernelName.isEmpty, "Kernel name should not be empty.")
    }

    func testKernelNameIsValid() {
        // Get the kernel name
        let kernelName: String = SISystemInfo.getKernelName()
        
        // Check that kernel name is valid (shouldn't be "Unknown kernel name")
        XCTAssertFalse(kernelName == "Unknown kernel name",
                       "Kernel name should not be Unknown kernel name.")
    }
    
    /*
     * Testing functions that return floats. They require a test to verify that
     * the returned float is in the range [0, 1] and a test to verify that the
     * returned float is not -1.0f.
     */
    
    func testCPULoadInRange() {
        // Get the CPU load
        let cpuLoad: Float = SISystemInfo.getCpuLoad()
        
        // Check that CPU load is between 0 and 1
        XCTAssertTrue(cpuLoad >= 0 && cpuLoad <= 1,
                      "CPU load should be between 0 and 1.")
    }
    
    func testCPULoadNotNegativeOne() {
        // Get the CPU load
        let cpuLoad: Float = SISystemInfo.getCpuLoad()
        
        // Check that CPU load is not -1.0f
        XCTAssertFalse(cpuLoad == -1.0, "CPU load should not be -1.0.")
    }
    
    func testMemoryUsageInRange() {
        // Get the memory usage
        let memoryUsage: Float = SISystemInfo.getMemoryUsage()
        
        // Check that memory usage is between 0 and 1
        XCTAssertTrue(memoryUsage >= 0 && memoryUsage <= 1,
                      "Memory usage should be between 0 and 1.")
    }
    
    func testMemoryUsageNotNegativeOne() {
        // Get the memory usage
        let memoryUsage: Float = SISystemInfo.getMemoryUsage()
        
        // Check that memory usage is not -1.0f
        XCTAssertFalse(memoryUsage == -1.0, "Memory usage should not be -1.0.")
    }
    
    func testDiskUsageInRange() {
        // Get the disk usage
        let diskUsage: Float = SISystemInfo.getDiskUsage()
        
        // Check that disk usage is between 0 and 1
        XCTAssertTrue(diskUsage >= 0 && diskUsage <= 1,
                      "Disk usage should be between 0 and 1.")
    }
    
    func testDiskUsageNotNegativeOne() {
        // Get the disk usage
        let diskUsage: Float = SISystemInfo.getDiskUsage()
        
        // Check that disk usage is not -1.0f
        XCTAssertFalse(diskUsage == -1.0, "Disk usage should not be -1.0.")
    }
}
