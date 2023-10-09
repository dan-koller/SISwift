import XCTest
@testable import SISwift

final class SISwiftTests: XCTestCase {
    
    func testArchitectureIsNotEmpty() {
        // Get the system architecture
        let architecture: String = SISystemInfo.getArchitecture()
        
        // Check that architecture is not empty
        XCTAssertFalse(architecture.isEmpty, "Architecture should not be empty.")
    }
    
    func testCPULoadInRange() {
        // Get the CPU load
        let cpuLoad: Float = SISystemInfo.getCpuLoad()
        
        // Check that CPU load is between 0 and 1
        XCTAssertTrue(cpuLoad >= 0 && cpuLoad <= 1, "CPU load should be between 0 and 1.")
    }
    
    func testMemoryUsageInRange() {
        // Get the memory usage
        let memoryUsage: Float = SISystemInfo.getMemoryUsage()
        
        // Check that memory usage is between 0 and 1
        XCTAssertTrue(memoryUsage >= 0 && memoryUsage <= 1, "Memory usage should be between 0 and 1.")
    }
    
    func testDiskUsageInRange() {
        // Get the disk usage
        let diskUsage: Float = SISystemInfo.getDiskUsage()
        
        // Check that disk usage is between 0 and 1
        XCTAssertTrue(diskUsage >= 0 && diskUsage <= 1, "Disk usage should be between 0 and 1.")
    }
}
