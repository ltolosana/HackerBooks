//
//  LMTBookViewController.m
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBookViewController.h"
#import "LMTSimplePDFViewController.h"
#import "LMTBook.h"

@interface LMTBookViewController ()

@end

@implementation LMTBookViewController

#pragma mark - Init
-(id) initWithModel:(LMTBook *) model{
    
    if (self= [super initWithNibName:nil
                              bundle:nil]) {
        _model = model;
        self.title = model.title;
    }
    
    return self;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronize model and views
    [self syncViewWithModel];
    
    // Whether in SplitVC
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)displayPDF:(id)sender{
    
    NSLog(@"Nos muestra el pdf:%@", self.model.pdfURL);
    
    // Create a pdfVC
    LMTSimplePDFViewController *pdfVC = [[LMTSimplePDFViewController alloc] initWithModel:self.model];
    
    // Push
    [self.navigationController pushViewController:pdfVC
                                         animated:YES];
    
}

-(IBAction)changeToFavorite:(id)sender{
    
    if ([sender isOn]) {
        self.model.isFavorite = YES;
        NSLog(@"ON");
    }else{
        self.model.isFavorite = NO;
        NSLog(@"OFF");
    }
}


#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    // Table is visible?
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // Table is Hidden behind the button
        // Show the button in the NavBar
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else{
        // Table is visible so hide the button
        self.navigationItem.leftBarButtonItem = nil;
        
    }
}


#pragma mark - LMTLibraryTableViewControllerDelegate
-(void) libraryTableViewController:(LMTLibraryTableViewController *)uVC didSelectbook:(LMTBook *)book{
    
    // Update the model 
    self.model = book;
    
    // Sincronize model and views
    [self syncViewWithModel];
    
}

#pragma mark - Utils
-(void) syncViewWithModel{
    self.titleLabel.text = self .model.title;
    self.authorsLabel.text = [self.model.authors componentsJoinedByString:@", "];
    self.tagsLabel.text = [self.model.tags componentsJoinedByString:@", "];
    [self.isFavoriteSwitch setOn:self.model.isFavorite];
//    self.photoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.model.imageURL]];
    self.photoView.image = self.model.image;
}


@end
