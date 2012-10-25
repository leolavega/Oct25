//
//  Oct25AppDelegate.h
//  Oct25
//
//  Created by Leonardo Lavega on 10/25/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;


@interface Oct25AppDelegate : UIResponder <UIApplicationDelegate>{
	View *view;
	UIWindow *_window;

}

@property (strong, nonatomic) UIWindow *window;

@end
