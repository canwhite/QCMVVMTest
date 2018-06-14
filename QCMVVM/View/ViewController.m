//
//  ViewController.m
//  QCMVVM
//
//  Created by EricZhang on 2018/6/1.
//  Copyright © 2018年 BYX. All rights reserved.
//

#import "ViewController.h"
#import "QCViewModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) QCViewModel *viewModel;

@property(nonatomic,strong) NSArray *bindArr;

@property(nonatomic,strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
    [self bindData];
    
    
}

-(void)bindData{
    
    
    self.viewModel = [QCViewModel new];
    //信号塔先建好
    @weakify(self);
    [self.viewModel.successObject subscribeNext:^(id x) {
        
        @strongify(self);
        NSArray *arr = x;
        
        NSLog(@"%@",arr);
        self.bindArr = arr;
        [self.tableView reloadData];

    }];
    //发信号
    [self.viewModel exchangeData];

}


//MARK: tableview DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bindArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [self.bindArr[indexPath.row] valueForKey:@"title"];
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.textColor =[UIColor grayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
    
    
}


//MARK: tableview Delagete
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%@",@"我点击了tableView事件");
    
}




//MARK: tableview 懒加载
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [UITableView new];
        //初始化背景颜色为白色
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
