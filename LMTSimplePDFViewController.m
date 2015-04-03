//
//  LMTSimplePDFViewController.m
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTSimplePDFViewController.h"
#import "LMTBook.h"

@interface LMTSimplePDFViewController ()

@end

@implementation LMTSimplePDFViewController

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
    
    // Delegates
    self.reader.delegate = self;
    
    [self.activityView setHidden:NO];
    [self.activityView startAnimating];

    
    // Sync model & View
    
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfURL:self.model.pdfURL
                                         options:NSDataReadingMappedIfSafe
                                           error:&error];
    
    if (data == nil) {
        NSLog(@"Error, no existe el libro '%@' solicitado", self.model.title);
        [[[UIAlertView alloc] initWithTitle:@"Libro no encontrado"
                                   message:@"Sorry, no existe el libro solicitado."
                                  delegate:nil
                         cancelButtonTitle:@"OK"
                         otherButtonTitles:nil, nil] show];
        [self.navigationController popViewControllerAnimated:NO];
        
    }else{
        
        [self.reader loadData:data
                     MIMEType:@"application/pdf"
             textEncodingName:@"UTF-8"
                      baseURL:nil];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    // Paro y oculto el activity
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
