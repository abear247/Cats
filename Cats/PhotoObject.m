//
//  PhotoObject.m
//  Cats
//
//  Created by Alex Bearinger on 2017-01-30.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "PhotoObject.h"

@interface PhotoObject()
@property NSString *server;
@property int farm;
@property NSString *photoId;
@property NSString *secret;
@end

@implementation PhotoObject

-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.dict = dict;
        self.farm = [dict[@"farm"] intValue];
        self.secret = dict[@"secret"];
        self.photoId = dict[@"id"];
        self.server = dict[@"server"];
        NSString *url = [NSString stringWithFormat:@"https://farm{%d}.staticflickr.com/{%@}/{%@}_{%@}.jpg",self.farm,self.server,self.photoId,self.secret];
        _url = [NSURL URLWithString:url];
    }
    return self;
}


@end
