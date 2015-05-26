# JS-function-and-ObjC-method-connector

Running a Javascript function from the JS within a Cocoa Web View is relatively easy, 
but having a Javascript function run an Objective-C method isn't as easy.  Since
Apple's documentation leaves a lot to be desired and there wasn't a lot of help
in the usual places, I created the simplest proof of concept to show the two-way
connections between JS and ObjC functions and methods.

Also, since this is an excellent way to do javascript coding inside an objective-C
application, I included the ability to use a local HTML file, a remote HTML file and
a remote HTML file that includes a POST so you can send a user and token, say.

No license, no warranty, use as is for any purpose you see fit.
