//
//  LMTBook.m
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBook.h"

@implementation LMTBook

#pragma mark - Class methods
+(instancetype) bookWithTitle:(NSString *) title
                      authors:(NSArray *) authors
                         tags:(NSArray *) tags
                   isFavorite:(BOOL) isFavorite
                     imageURL:(NSURL *) imageURL
                       pdfURL:(NSURL *) pdfURL{
    return [[self alloc] initWithTitle:title
                               authors:authors
                                  tags:tags
                            isFavorite:isFavorite
                              imageURL:imageURL
                                pdfURL:pdfURL];
}

#pragma mark - Init
-(id) initWithTitle:(NSString *) title
            authors:(NSArray *) authors
               tags:(NSArray *) tags
         isFavorite:(BOOL) isFavorite
           imageURL:(NSURL *) imageURL
             pdfURL:(NSURL *) pdfURL{
    
    if (self = [super init]) {
        _title = title;
        _authors = authors;
        _tags = tags;
        _isFavorite = isFavorite;
        _imageURL = imageURL;
        _pdfURL = pdfURL;
        
    }
    
    return self;
}


@end
