//
//  ViewController.m
//  示论说-01
//
//  Created by Song on 17/6/24.
//  Copyright © 2017年 Song. All rights reserved.
//
//
//    CGFloat x = 141;
//    CGFloat y = 65;
//    CGFloat w = 130;
//    CGFloat h = 400;

#import "ViewController.h"
#import "ShopCollectionViewCell.h"
#import "WaterflowLayout.h"
#import "MJExtension.h"
#import "MJRefresh.h"

static NSString *const cellID = @"shop";
static NSString *const nibName = @"ShopCollectionViewCell";

@interface ViewController () <UICollectionViewDataSource, WaterflowLayoutDelegate>

- (IBAction)fenlei:(id)sender;
@property (nonatomic, strong) NSMutableArray *shops;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic,weak) UIView *mainvieww;// 创建背景透明view
@property (nonatomic,weak) UIView *newvieww; // 白色长方形view
@end

@implementation ViewController

- (NSMutableArray *)shops
{
    if (!_shops) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}

- (IBAction)fenlei:(id)sender {
    
    if (self.mainvieww.hidden == NO) {
        self.mainvieww.hidden = YES; // 消失
    }else{
        self.mainvieww.hidden = NO; // 显示
        
        // 动画：
        CGRect frame1 = self.newvieww.frame;
        frame1.origin.y -=435;
        self.newvieww.frame = frame1;
        frame1.origin.y +=435;
        
        [UIView animateWithDuration:0.5 animations:^{
            self.newvieww.frame = frame1;
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLayout];
    [self setupRefresh];
    [self creatView];
}

// 创建下拉view
-(void)creatView {
    
    // 创建背景透明view
    UIView *mainView = [[UIView alloc] initWithFrame:self.tabBarController.view.frame];
    mainView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:mainView];

    // 创建白色长方形view
    CGFloat x = 141;
//    CGFloat y = 65;
    CGFloat y = 65;
    CGFloat w = 130;
    CGFloat h = 370;
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    newView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:newView];
    
    // 创建按钮
    
    for (int i = 0; i<9; i++) {
        CGRect frame = CGRectMake(10, 10+(i*40), 110, 30);//按钮位置大小
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = frame;
        
        NSString *name;
        if (i==0) {
            name = @"理学";
            [button addTarget:self action:@selector(buttonClicked)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==1) {
            name = @"工学";
            [button addTarget:self action:@selector(loadNewShops)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==2) {
            name = @"农学";
            [button addTarget:self action:@selector(buttonClicked)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==3) {
            name = @"医学";
            [button addTarget:self action:@selector(loadNewShops)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==4) {
            name = @"经济学";
            [button addTarget:self action:@selector(buttonClicked)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==5) {
            name = @"教育学";
            [button addTarget:self action:@selector(loadNewShops)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==6) {
            name = @"文学";
            [button addTarget:self action:@selector(buttonClicked)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==7) {
            name = @"历史学";
            [button addTarget:self action:@selector(loadNewShops)forControlEvents:UIControlEventTouchUpInside];
        }else if (i==8) {
            name = @"艺术学";
            [button addTarget:self action:@selector(buttonClicked)forControlEvents:UIControlEventTouchUpInside];
        }else {
            name = @"军事学";
            [button addTarget:self action:@selector(loadNewShops)forControlEvents:UIControlEventTouchUpInside];
        }
        
        [button setTitle:name forState:UIControlStateNormal];
        [button setTintColor:[UIColor whiteColor]];
        button.backgroundColor = [UIColor lightGrayColor];
        button.clipsToBounds=YES; // 裁剪超出父视图的部分
        button.layer.cornerRadius=5; // 圆角度数
        
        [newView addSubview:button];
    };
    
    self.newvieww = newView;
    mainView.hidden = YES;
    self.mainvieww = mainView;
}



-(void)buttonClicked {
    NSLog(@"click -- click");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [ShopModel objectArrayWithFilename:@"1.plist"];
        [self.shops removeAllObjects];
        [self.shops addObjectsFromArray:shops];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.header endRefreshing];
    });
    self.mainvieww.hidden = YES;
}

//隐藏状态栏
//-(BOOL)prefersStatusBarHidden {
//    return YES;
//}



/**
 *  设置刷新
 */
- (void)setupRefresh
{
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewShops)];
    [self.collectionView.header beginRefreshing];
    
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreShops)];
    self.collectionView.footer.hidden = YES;
}

/**
 *  加载最新数据
 */
- (void)loadNewShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *shops = [ShopModel objectArrayWithFilename:@"2.plist"];
        [self.shops removeAllObjects];
        [self.shops addObjectsFromArray:shops];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.header endRefreshing];
    });
    self.mainvieww.hidden = YES;
}
/**
 *  加载更多数据
 */
- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *shops = [ShopModel objectArrayWithFilename:@"2.plist"];
        [self.shops addObjectsFromArray:shops];
        
        // 刷新数据
        [self.collectionView reloadData];
        
        [self.collectionView.footer endRefreshing];
    });
}

- (void)setupLayout
{
    // 创建布局
    WaterflowLayout *layout = [[WaterflowLayout alloc] init];
    layout.delegate = self;
    //UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    // 注册
    [collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:cellID];
    
    
    self.collectionView = collectionView;
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collectionView.footer.hidden = self.shops.count == 0;
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.viewCon = self;
    cell.shop = self.shops[indexPath.item];
    return cell;
    
}

#pragma mark - WaterflowLayoutDelegate
- (CGFloat)waterflowLayout:(WaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    ShopModel *shop = self.shops[index];
    
    return itemWidth * shop.h / shop.w;
}

@end
