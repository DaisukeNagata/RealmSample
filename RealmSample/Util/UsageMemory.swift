//
//  UsageMemory.swift
//  RealmSample
//
//  Created by 永田大祐 on 2017/04/14.
//  Copyright © 2017年 永田大祐. All rights reserved.
//
//http://stackoverflow.com/questions/40991912/how-to-get-memory-usage-of-my-application-and-system-in-swift-by-programatically
import Foundation

func report_memory()-> String {
    var taskInfo = mach_task_basic_info()
    var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
    let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
        }
    }
    
    if kerr == KERN_SUCCESS {
       print( "Memory used in MB: \(taskInfo.resident_size/1048576)")
    }
    else {
        print("Error with task_info(): " +
            (String(cString: mach_error_string(kerr), encoding: String.Encoding.ascii) ?? "unknown error"))
    }
    return "MB:\(taskInfo.resident_size/1048576)"
}

