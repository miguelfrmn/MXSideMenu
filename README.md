# MXSideMenu

MXSideMenu is a simple project for adding a side menu like the one used on the Facebook, Path and Google+ iOS apps. 

# How to use
- Copy the files MXSideMenuViewController.h, MXSideMenuViewController.m and MXSideMenuViewController.xib into your project.
- In you AppDelegate.h modify your - (BOOL)application:didFinishLaunchingWithOptions: so it looks like this:


  ```objective-c
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    _rootController = [[MXSideMenuViewController alloc] init];

    FirstViewController* first = [[FirstViewController alloc] init];
    SecondViewController* second = [[SecondViewController alloc] init];
    ThirdViewController* third = [[ThirdViewController alloc] init];
    
    [_rootController addViewController:first Title:@"First" Icon:@"icon_radar.png"];
    [_rootController addViewController:second Title:@"Second" Icon:@"icon_radar.png"];
    [_rootController addViewController:third Title:@"Third" Icon:@"icon_radar.png"];
   
    self.window.rootViewController = _rootController;
    
    [self.window makeKeyAndVisible];
    return YES; ```


# License
Copyright (C) 2012 Miguel Fermin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
# Contact
If you have any comments drop me a line at miguelx at gmail dot com