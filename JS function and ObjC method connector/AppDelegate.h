//
//  AppDelegate.h
//  JS function and ObjC method connector
//
//  Created by Michael Diedrick on 5/26/15.
//  Copyright (c) 2015 Michael Diedrick. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSWindow *testWin;
    IBOutlet WebView *testWinWebView;
}

- (IBAction)tellJSSomething:(id)sender;
- (IBAction)tellJSManyThings:(id)sender;

@end

