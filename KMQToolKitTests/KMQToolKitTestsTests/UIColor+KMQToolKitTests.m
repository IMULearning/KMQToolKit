//
//  UIColor+KMQToolKitTests.m
//  KMQToolKitTests
//
//  Created by Weinan Qiu on 2015-10-24.
//  Copyright © 2015 Kumiq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KMQToolKit/UIColor+KMQToolKit.h>
#import <KMQToolKit/KMQColorPalette.h>
#import <KMQToolKit/NSBundle+KMQToolKit.h>

@interface UIColor_KMQToolKitTests : XCTestCase

@end

@implementation UIColor_KMQToolKitTests

- (void)setUp {
    [super setUp];
    
    [UIColor setupColorPalleteWithContentsOfFile:[NSBundle plistPathForResource:@"colors"
                                                                inBundleOfClass:[self class]]
                                       keyInFile:@"colors"];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testGetSimpleColor {
    UIColor *sampleColor1 = [KMQColorPalette colorForName:@"sampleColor1"];
    
    XCTAssertNotNil(sampleColor1);
    
    CGFloat red, green, blue, alpha;
    [sampleColor1 getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertEqual(0.0f, red);
    XCTAssertEqual(0.0f, green);
    XCTAssertEqual(0.0f, blue);
    XCTAssertEqual(1.0f, alpha);
}

- (void)testGetColorWithAlpha {
    UIColor *sampleColor2 = [KMQColorPalette colorForName:@"sampleColor2"];
    
    CGFloat red, green, blue, alpha;
    [sampleColor2 getRed:&red green:&green blue:&blue alpha:&alpha];
    
    XCTAssertTrue(204.0f/255.0f - red < 1.0f / 255.0f);
    XCTAssertTrue(204.0f/255.0f - blue < 1.0f / 255.0f);
    XCTAssertTrue(204.0f/255.0f - green < 1.0f / 255.0f);
    XCTAssertTrue(200.0f/255.0f - alpha < 1.0f / 255.0f);
}

@end
