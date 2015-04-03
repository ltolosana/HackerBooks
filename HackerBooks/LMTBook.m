//
//  LMTBook.m
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 25/3/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTBook.h"

@implementation LMTBook

@synthesize  image = _image;

#pragma mark - Properties
-(UIImage *) image{
    
    if (_image == nil) {
        _image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.imageURL]];
    }
    return _image;
}


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

-(id) initWithDictionary:(NSDictionary *) dict{
    
    return [self initWithTitle:[dict objectForKey:@"title"]
                       authors:[[dict objectForKey:@"authors"] componentsSeparatedByString:@", "]
                          tags:[[dict objectForKey:@"tags"] componentsSeparatedByString:@", "]
                    isFavorite:NO
                      imageURL:[NSURL URLWithString:[dict objectForKey:@"image_url"]]
                        pdfURL:[NSURL URLWithString:[dict objectForKey:@"pdf_url"]]];
            
    
}


#pragma mark - Utils
/*
 -(NSArray *) extractTagsFromJSONArray:(NSArray *) JSONArray{
    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for (NSDictionary *dict in JSONArray) {
        [tags addObject:[dict objectForKey:@"tags"]];
    }
    return tags;
}
*/

@end
