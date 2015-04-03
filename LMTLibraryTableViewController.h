//
//  LMTLibraryTableViewController.h
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import UIKit;

@class LMTLibrary;
#import "LMTBook.h"

@class LMTLibraryTableViewController;

@protocol LMTLibraryTableViewControllerDelegate <NSObject>

@optional
-(void) libraryTableViewController:(LMTLibraryTableViewController *) libraryVC didSelectbook:(LMTBook *) book;

@end

@interface LMTLibraryTableViewController : UITableViewController<LMTLibraryTableViewControllerDelegate>

@property (strong, nonatomic) LMTLibrary *model;
@property (weak, nonatomic) id<LMTLibraryTableViewControllerDelegate> delegate;

-(id) initWithModel:(LMTLibrary *) model style:(UITableViewStyle) style;

@end
