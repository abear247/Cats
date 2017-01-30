//
//  CollectionViewCell.m
//  Cats
//
//  Created by Alex Bearinger on 2017-01-30.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "CollectionViewCell.h"
#import "PhotoObject.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation CollectionViewCell


-(void)setPhoto:(PhotoObject *)photo{
    self.photo = photo;
    self.title.text = photo.dict[@"title"];
    NSData *data = [NSData dataWithContentsOfURL:photo.url];
    self.catImageView.image = [UIImage imageWithData:data];
}

@end
