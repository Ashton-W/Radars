//
//  ColorsTests.m
//  ColorsTests
//
//  Created by Ashton Williams on 6/07/2016.
//  Copyright © 2016 Ashton-W. All rights reserved.
//

#import <XCTest/XCTest.h>

#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

@interface ColorsTests : XCTestCase

@end

@implementation ColorsTests

- (void)testExample {
    setenv("XcodeColors", "YES", 0);

    NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;" @"Blue text" XCODE_COLORS_RESET);
    
    NSLog(XCODE_COLORS_ESCAPE @"bg220,0,0;" @"Red background" XCODE_COLORS_RESET);
    
    NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;"
          XCODE_COLORS_ESCAPE @"bg220,0,0;"
          @"Blue text on red background"
          XCODE_COLORS_RESET);
    
    NSLog(XCODE_COLORS_ESCAPE @"fg209,57,168;" @"You can supply your own RGB values!" XCODE_COLORS_RESET);
}

@end
