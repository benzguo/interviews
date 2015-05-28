#import "BPRootViewController.h"
#import "BPRootViewModel.h"
#import "BPRefreshControl.h"

@interface BPRootViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

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

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    BPRefreshControl *refreshControl = [[BPRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 0, 50)
                                                                    scrollView:self.scrollView];
    [view addSubview:self.scrollView];

    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGRect bounds = self.view.bounds;
    self.scrollView.frame = bounds;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(bounds), CGRectGetHeight(bounds)*1.2);

}

@end
