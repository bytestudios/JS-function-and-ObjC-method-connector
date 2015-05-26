//
//  AppDelegate.m
//  JS function and ObjC method connector
//
//  Created by Michael Diedrick on 5/26/15.
//  Copyright (c) 2015 Michael Diedrick. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (void)awakeFromNib{
    // necessary for listener to register
    [testWinWebView setFrameLoadDelegate:self];
    // add page from local main bundle
    [[testWinWebView mainFrame] loadRequest: [NSURLRequest requestWithURL: [NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"local_page" ofType:@"html"]]]];
    
    // or load it from remote location
    //[[testWinWebView mainFrame] loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://madewithloveinmilwaukee.org/"]]];
    
    // or load it from remote location using POST
    /*
     NSString *post = [NSString stringWithFormat:@"q=%@", @"mokey"];
     NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
     NSString *postLength = [NSString stringWithFormat:@"%lu", [postData length]];
     NSURL *url = [NSURL URLWithString:[@"https://www.google.com" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
     [theRequest setHTTPMethod:@"POST"];
     [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
     [theRequest setHTTPBody:postData];
     [[testWinWebView mainFrame] loadRequest: theRequest];
     */
}

//this is called as soon as the script environment is ready in the webview
- (void)webView:(WebView *)sender didClearWindowObject:(WebScriptObject *)windowScriptObject forFrame:(WebFrame *)frame {
    //add the controller to the script environment
    //the "ObjCConnector" object will now be available to JavaScript
    [windowScriptObject setValue:self forKey:@"ObjCConnector"];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


// telling something to Javascript:
- (void)tellJSSomething:(id)sender {
    NSLog(@"> tellJSSomething");
    // telling a script object to run is easy with windowScriptObject
    id win = [testWinWebView windowScriptObject];
    // send array of one object to JS function
    [win callWebScriptMethod:@"localJSFunctionOne" withArguments:[NSArray arrayWithObject:@"Why, hello there!"]];
}

// telling many things to Javascript:
- (void)tellJSManyThings:(id)sender {
    NSLog(@"> tellJSManyThings");
    // telling a script object to run is easy with windowScriptObject
    id win = [testWinWebView windowScriptObject];
    // create array of arguments to send
    NSArray *args = [NSArray arrayWithObjects: @"Mokey", [NSNumber numberWithInt:19], [NSNumber numberWithInt:70], nil];
    // send array values to JS function
    [win callWebScriptMethod:@"localJSFunctionTwo" withArguments:args];
}

// send log to JS
- (void)JSLog:(NSString*) lineItem {
    // telling a script object to run is easy with windowScriptObject
    id win = [testWinWebView windowScriptObject];
    // send array of one object to JS function
    [win callWebScriptMethod:@"localJSLog" withArguments:[NSArray arrayWithObject:lineItem]];
    
}

//this is a simple log command
- (void)acceptJavaScriptFunctionOne:(NSString*) logText {
    NSLog(@"acceptJavaScriptFunctionOne: %@",logText);
    [self JSLog:[NSString stringWithFormat:@"acceptJavaScriptFunctionOne got %@", logText]];
}
- (void)acceptJavaScriptFunctionTwo:(NSString*) logText {
    NSLog(@"acceptJavaScriptFunctionTwo: %@",logText);
    [self JSLog:[NSString stringWithFormat:@"acceptJavaScriptFunctionTwo got %@", logText]];
}

//this returns a nice name for the method in the JavaScript environment
+(NSString*)webScriptNameForSelector:(SEL)sel {
    NSLog(@"%@ received %@ with sel='%@'", self, NSStringFromSelector(_cmd), NSStringFromSelector(sel));
    if(sel == @selector(acceptJavaScriptFunctionOne:))
        return @"functionOne"; // this is what you're sending in from JS to map to above line
    if(sel == @selector(acceptJavaScriptFunctionTwo:))
        return @"functionTwo"; // this is what you're sending in from JS to map to above line
    return nil;
}

//this allows JavaScript to call the -logJavaScriptString: method
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)sel {
    NSLog(@"isSelectorExcludedFromWebScript: %@", NSStringFromSelector(sel));
    if(sel == @selector(acceptJavaScriptFunctionOne:) ||
       sel == @selector(acceptJavaScriptFunctionTwo:))
        return NO;
    return YES;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end
