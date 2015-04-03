//
//  LMTLibraryTableViewController.h
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import UIKit;

@class LMTLibrary;

@interface LMTLibraryTableViewController : UITableViewController

@property (strong, nonatomic) LMTLibrary *model;

-(id) initWithModel:(LMTLibrary *) model style:(UITableViewStyle) style;

@end
