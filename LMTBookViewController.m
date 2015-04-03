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
    }
    
    return self;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Sincronize model and views
    self.titleLabel.text = self .model.title;
    self.authorsLabel.text = [self.model.authors componentsJoinedByString:@", "];
    self.tagsLabel.text = [self.model.tags componentsJoinedByString:@", "];
    [self.isFavoriteSwitch setOn:self.model.isFavorite];
    self.photoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.model.imageURL]];
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

@end
