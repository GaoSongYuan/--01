//
//  ShopCollectionViewCell.h
//  WaterFlow
//
//  Created by 谢飞 on 16/2/6.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

//@class ShopCollectionViewCell;
//
//@protocol ShopCollectionViewCelldelegate <NSObject>
//
//@optional
//
//
//@end


@interface ShopCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) ShopModel *shop;
@property (nonatomic, weak) UIViewController *viewCon;



@end
