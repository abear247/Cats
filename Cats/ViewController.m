//
//  ViewController.m
//  Cats
//
//  Created by Alex Bearinger on 2017-01-30.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "ViewController.h"
#import "PhotoObject.h"
#import "CollectionViewCell.h"

@interface ViewController ()
@property NSArray *photos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *parseURL = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json=1&nojsoncallback=1&api_key={api-key}&tags=cat"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:parseURL];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error){
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *rawPhotos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dict in rawPhotos){
            PhotoObject *photo = [[PhotoObject alloc] initWithDict:dict];
            [temp addObject:photo];
        }
        self.photos = [temp copy];
    }];
    [dataTask resume];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    PhotoObject *photo = self.photos[indexPath.item];
    cell.title.text = photo.dict[@"title"];
    cell.catImageView.image = photo.image;
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photos.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
