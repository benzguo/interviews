#import "BPRootViewController.h"
#import "BPRootViewModel.h"

@interface BPRootViewController ()

@end

@implementation BPRootViewController

- (instancetype)initWithViewModel:(BPRootViewModel *)viewModel
{
    self = [super init];
    if (self) {
        self.title = viewModel.title;
    }
    return self;
}

- (void)loadView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

@end
