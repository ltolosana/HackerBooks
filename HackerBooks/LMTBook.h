//
//  LMTBook.h
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

@import Foundation;

@interface LMTBook : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *tags;
@property (nonatomic) BOOL isFavorite;
@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) NSURL *pdfURL;

// Class methods
+(instancetype) bookWithTitle:(NSString *) title
                      authors:(NSArray *) authors
                         tags:(NSArray *) tags
                   isFavorite:(BOOL) isFavorite
                     imageURL:(NSURL *) imageURL
                       pdfURL:(NSURL *) pdfURL;

// Designated
-(id) initWithTitle:(NSString *) title
            authors:(NSArray *) authors
               tags:(NSArray *) tags
         isFavorite:(BOOL) isFavorite
           imageURL:(NSURL *) imageURL
             pdfURL:(NSURL *) pdfURL;



@end
