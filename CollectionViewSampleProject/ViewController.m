//
//  ViewController.m
//  CollectionViewSampleProject
//
//  Created by tksuuu on 2014/05/14.
//  Copyright (c) 2014年 tksuuu. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    
    __weak IBOutlet UICollectionView *myCollectionView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [myCollectionView registerClass:[CustomCollectionCell class] forCellWithReuseIdentifier:@"Cell"];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//セクション数を設定
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

// セクションに応じたセルの数を返す
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return datas.count;
    return 10;
}

// セルオブジェクトを返す
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    CustomCollectionCell *cell = [myCollectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    CustomCollectionCell *cell = (CustomCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//    cell.label.text = datas[indexPath.row];
    cell.mainLabel.text = @"aaa";
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    NSLog(@"%d", indexPath.section);
//    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
//    datasetCell.backgroundColor = [UIColor blueColor]; // highlight selection

    for (int i = 0; i < [myCollectionView visibleCells].count; i++) {
        NSIndexPath *roopIndexPath = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        CustomCollectionCell *cellll = (CustomCollectionCell *)[collectionView cellForItemAtIndexPath:roopIndexPath];
        cellll.backgroundColor = [UIColor clearColor];
    }
    
    CustomCollectionCell *cell = (CustomCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    
    
}

@end
