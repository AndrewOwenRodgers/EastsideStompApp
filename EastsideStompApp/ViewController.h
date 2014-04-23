//
//  ViewController.h
//  EastsideStompApp
//
//  Created by Andrew Rodgers on 2/26/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDScrollableTabBar.h"
#import "IDScrollableTabBarDelegate.h"
#import "IDScrollableTabBarItem.h"
#import <RNFrostedSidebar.h>

@interface ViewController : UIViewController
<IDScrollableTabBarDelegate, RNFrostedSidebarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *stuffView;
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) UIView *calendarView;
@property (strong, nonatomic) UIView *socialView;
@property (strong, nonatomic) UIView *classesView;
@property (strong, nonatomic) UIView *directionsView;
@property (weak, nonatomic) UITableView *calendarTable;

@end