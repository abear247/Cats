//
//  PhotoObject.h
//  Cats
//
//  Created by Alex Bearinger on 2017-01-30.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoObject : NSObject
@property NSURL *url;
@property NSDictionary *dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
