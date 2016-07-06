//
//  SourceEditorExtension.swift
//  EditorExtension
//
//  Created by Ashton Williams on 23/06/2016.
//  Copyright © 2016 Ashton-W. All rights reserved.
//

import Foundation
import XcodeKit
import Cocoa

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    
}

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: (NSError?) -> Void ) -> Void {
        NSWorkspace.shared().launchApplication("TextEdit")
        completionHandler(nil)
    }
    
}
