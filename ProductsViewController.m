//
//  ProductsViewController.m
//  ManogoFresh
//
//  Created by Aparna Reddy Challa on 18/12/14.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "ProductsViewController.h"
#import "MBProgressHUD.h"
//#import "ASIHTTPRequest.h"
//#import "ASIFormDataRequest.h"
//#import"JSON1.h"
#import "ProductTblCell.h"
//#import "AsyncImageView1.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "ForgotPassVC.h"
#import "CartVC.h"
#import "URLImageView.h"
#import "MyOrdersVC.h"
#import "CategoriesViewController.h"
#import "ProductDetails.h"
#import "MyAccountView.h"
#import "CategoryProductsView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
#define ASYNC_IMAGE_TAG 9999
@interface ProductsViewController (){
    int onofftime;
    UIPanGestureRecognizer*pangesture;
}
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end

@implementation ProductsViewController
@synthesize products_bar_lbl,scroll_underview,scrollproduct,tab_view,login_check_view,login_btn,signup_link_btn,show_pass_btn,pass_txtfield,login_lbl,login_subtitle,logout_btn,drop_down_view,login_or_signup_btn,cancel_or_return_bnt,whishlist_btn,myorders_btn,profile_btn,myaddress_btn,policies_btn,cantactus_btn,drop_down_btn_pro,promotions_lbl,products_down_lbl,orders_down_lbl,logoutimgicon_imgview,profile_dropdw_imgview,usernme_imgicon_imgview,logged_usrname_show_lbl,cancel_btn,emailid_txtfield,sliderscroll,newarrivalsscroll,featuredscroll,left_menu_brand_btn,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,topBarDentistkartView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //[self.navigationController setNavigationBarHidden:YES];
global_page_id=@"ProductsViewController";
    //addcartcheckint=2;
   // [self removeunrefferenceobjects];
    onofftime=0;
    reloads_latest_int=2;
    reloads_recent_int=2;
        ///////////////////ScrollProduct ////////////////////////////////
    scrollproduct.scrollEnabled=YES;
    scrollproduct.userInteractionEnabled=YES;
    scrollproduct.pagingEnabled = YES;
    scrollproduct.showsHorizontalScrollIndicator = YES;
    scrollproduct.showsVerticalScrollIndicator = NO;
    scrollproduct.scrollsToTop = NO;
    ////////////////////////////////////////////////////////////////
    scrollproduct.delegate = self;
    //[self.scrollproduct addSubview:scroll_underview];
    ///////////////Call Slider Service////////////////////////////////
   
    ////////////////////////////////////////////////////////////
    /////////////////////// New Arrivals ScrollView///////////////////////
    newarrivalsscroll.delegate = self;
    newarrivalsscroll.scrollEnabled=YES;
    newarrivalsscroll.userInteractionEnabled=YES;
    newarrivalsscroll.pagingEnabled = YES;
    newarrivalsscroll.showsHorizontalScrollIndicator = YES;
    newarrivalsscroll.showsVerticalScrollIndicator = NO;
    newarrivalsscroll.scrollsToTop = NO;
    /////////////////////////////////////////////////////////////////////
    
    ///////////////////////Featured ScrollView///////////////////////////
    featuredscroll.delegate = self;
    featuredscroll.scrollEnabled=YES;
    featuredscroll.userInteractionEnabled=YES;
    featuredscroll.pagingEnabled = YES;
    featuredscroll.showsHorizontalScrollIndicator = YES;
    featuredscroll.showsVerticalScrollIndicator = NO;
    featuredscroll.scrollsToTop = NO;
    ///////////////////////////////////////////////////////////////////////
    
    
    
    //[featuredscroll setContentSize:CGSizeMake(1000, 128)];
    //[newarrivalsscroll setContentSize:CGSizeMake(1000, 128)];
    
    /*
    //////////////////Scroll vertically////////////////////////////////////
    scrollproduct.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views = @{@"scroll_underview":scroll_underview};
    NSDictionary *metrics = @{@"height" : @1000};
    [self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scroll_underview(height)]|" options:kNilOptions metrics:metrics views:views]];
    //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];

    ///////////////////////////////////////////////////////////////////////////////////////////////
    */
    
   //[self removecart];
    
    /////////////////////new arrivals scroll//////////////////////////
    
    newarrivalsscroll.translatesAutoresizingMaskIntoConstraints=NO;
    
    //self.dentistkart_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/25];
    //self.dentalmegastore_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/45];
    
    
   //[scrollproduct setContentSize:CGSizeMake(scroll_underview.frame.size.width,1000)];
    //[scroll_underview addSubview:scrollproduct];
    //[featuredscroll addSubview:self.featuredview];
    //[newarrivalsscroll addSubview:self.newarrivalsview];
  //[scrollproduct addSubview:scroll_underview];

   //tab_view.frame=CGRectMake(0,518, 320, 50);
    //tab_view.frame = CGRectZero;
    //tab_view.translatesAutoresizingMaskIntoConstraints = NO;
    //[self.view addSubview:tab_view];
    /*
    //////////////////Login Pop View/////////////////////
    drop_down_view.frame = CGRectMake(150, 70, 200, 50);
    [self.view addSubview:drop_down_view];
    drop_down_view.hidden= YES;
    /////////////////////////////////////////////////////
    */

    
   // products_tblview.delegate = self;
    //products_tblview.dataSource = self;
  
  //[products_tblview setBackgroundColor:[UIColor colorWithRed:250/255.0 green:241/250.0 blue:140/250.0 alpha:1]];
    seletedqtynum=0;
    product_id_arr = [[NSMutableArray alloc]init];
    //product_imgurl_arr =[[NSMutableArray alloc]init];
   // product_name_arr =[[NSMutableArray alloc]init];
   // product_price_arr =[[NSMutableArray alloc]init];
    //product_shopcost_arr=[[NSMutableArray alloc]init];
   // product_usercost_arr =[[NSMutableArray alloc]init];
    recentlybrought_productsids = [[NSMutableArray alloc]init];
    latestproductids_arr = [[NSMutableArray alloc]init];
    
    NSLog(@"screen width:%f",[self screenSize].width);
    NSLog(@"screen height:%f",[self screenSize].height);
    

    
    
    
    global_user_logedin_status=@"No";
    //[self getProductsInList];
    
    ////////////////hidden icon///////////
    logout_btn.hidden = YES;
    profile_dropdw_imgview.hidden=YES;
   // usernme_imgicon_imgview.hidden=YES;
    profile_btn.hidden=YES;
    logoutimgicon_imgview.hidden=YES;
   
    
        checkaddcart = 0;
   MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   hud.labelText = @"Loading....";

    cvc = [[CartVC alloc]init];
    
    
    
    
    //[self performSelectorInBackground:@selector(getCartCountValue) withObject:nil];
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
        [self performSelector:@selector(getCartCountValue) withObject:nil afterDelay:0.1];
    }else{
         NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
    }
 
    
    self.latest_products_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.recently_brought_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.more_latest_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.more_recent_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/30];
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    countimages=1;
    
            //[self getCartCountValue];
    
    //[self performSelectorInBackground:@selector(latestHomeProducts) withObject:nil];
    @autoreleasepool {
        
        [self performSelector:@selector(readlogin) withObject:nil afterDelay:0.1];
        [self performSelector:@selector(callMethods) withObject:nil afterDelay:0.1];
        
       // [self callMethods];

   [self performSelector:@selector(latestHomeProducts) withObject:nil afterDelay:0.0];
    }
    //[self latestHomeProducts];
    
    pageIdentify_str=@"ProductsViewController";
}

-(void)getCartCountValue{
    //addcartcheckint=0;
    [cvc readcartdb];
    [cvc countOfCartItems];
   // [self performSelectorInBackground:@selector(countOfCartItems) withObject:nil];
    
    
    NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
    [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
    
    if (cartcountvalue==0) {
        self.cartitemscount_btn.hidden=YES;
    }else{
        self.cartitemscount_btn.hidden=NO;
    }
    
    
}

-(void)callMethods{
    ///////////////////////Side Menu///////////////////////
   
    
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);
   // self.leftmenulist_view.translatesAutoresizingMaskIntoConstraints=NO;
    
    
    [scroll_underview addSubview:leftmenulist_view];
    
    //self.leftmenu_underview.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height/2);
    
    //[leftmenulist_view addSubview:self.leftmenu_underview];
   // self.left_menu_profile_image.frame = CGRectMake([self screenSize].width/2, 0, [self screenSize].width/2, [self screenSize].width/2);
    //[self.leftmenu_underview addSubview:self.left_menu_profile_image];

    
    //left_menu_profile_img.layer.cornerRadius=10;
    //left_menu_profile_img.clipsToBounds=YES;
    
    
    leftmenulist_view.hidden=YES;
    
            self.dentistkartname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
    
        left_menu_home_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_category_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_brand_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_promotions_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_polices_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_contact_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
        left_menu_logout_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
   
    if ([self screenSize].width<500) {
        
        left_menu_home_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_home_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_category_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_category_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_brand_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_brand_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_promotions_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_promotions_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_polices_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_polices_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_contact_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_contact_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
        
        left_menu_logout_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/30, 0, 0);
        left_menu_logout_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);

        
    }else{
    left_menu_home_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_home_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    
    left_menu_category_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_category_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);

    left_menu_brand_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_brand_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);

    left_menu_promotions_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_promotions_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);

    left_menu_polices_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_polices_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);

    left_menu_contact_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_contact_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);

    left_menu_logout_btn.imageEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/20, 0, 0);
    left_menu_logout_btn.titleEdgeInsets = UIEdgeInsetsMake(0, leftmenulist_view.bounds.size.width/10, 0, 0);
    }

   // [global_productid_arr removeAllObjects];
    //////////////////////////////////////////////////////////
    scrollonoff=1;
    self.closemenu_btn.hidden=YES;
 [self sliderImgsServices];
   // [self loadVisiblePages];
   pangesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panRecognized:)];
    pangesture.minimumNumberOfTouches=1;
    pangesture.maximumNumberOfTouches=1;
    [sliderscroll addGestureRecognizer:pangesture];
    /*
    
    
 UIPanGestureRecognizer* latestpangesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panRecognizedLatest:)];
    pangesture.minimumNumberOfTouches=1;
    pangesture.maximumNumberOfTouches=1;
    [self.newarrivalsview addGestureRecognizer:latestpangesture];
   
    
   UIPanGestureRecognizer *recentpangesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panRecognizedRecent:)];
    pangesture.minimumNumberOfTouches=1;
    pangesture.maximumNumberOfTouches=1;
   [self.featuredview addGestureRecognizer:recentpangesture];
    */
    
    
    
    //[self performSelector:@selector(loadVisiblePages) withObject:nil afterDelay:0.1];
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(sliderTimerCall) userInfo:nil repeats:YES];
    
    //[self performSelector:@selector(scrollViewDidScroll:) withObject:nil afterDelay:0.1];
    //[self performSelector:@selector(scrollViewDidScroll:) withObject:nil afterDelay:0.1];
    
    //timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(scrollViewDidScroll:) userInfo:nil repeats:YES];
}

-(void)sliderTimerCall{
[self.sliderscroll scrollRectToVisible:CGRectMake([self screenSize].width*countscrollimgs, 0, [self screenSize].width,self.sliderscroll.frame.size.height) animated:YES];

        self.pageController.currentPage = countscrollimgs;
    if (countscrollimgs==sliderimgIds_arr.count-1) {
    //self.pageController.currentPage = sliderimgIds_arr.count-1;
    countscrollimgs=0;
}else if (countscrollimgs<sliderimgIds_arr.count-1){
countscrollimgs++;
    
    
    //[self loadVisiblePages];
}

    NSLog(@"countscrollimgs:%d",countscrollimgs);
    
    //scrollonoff=1;
    scrollimgonce=0;
    //[self loadVisiblePages];
}



-(void)sliderManualCall{
    [self.sliderscroll scrollRectToVisible:CGRectMake([self screenSize].width*countscrollimgs, 0, [self screenSize].width,self.sliderscroll.frame.size.height) animated:YES];
    
    self.pageController.currentPage = countscrollimgs;
    /*
    if (countscrollimgs==sliderimgIds_arr.count-1) {
        //self.pageController.currentPage = sliderimgIds_arr.count-1;
        countscrollimgs=0;
       // scrollonoff=1;
    }else if (countscrollimgs<sliderimgIds_arr.count-1){
        countscrollimgs++;
        //scrollonoff=0;
        
        //[self loadVisiblePages];
    }
    
     */
    NSLog(@"countscrollimgs manual:%d",countscrollimgs);
    
    scrollonoff=1;
    scrollimgonce=0;
    //[self loadVisiblePages];
}




-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}
///////////////////////////////Slider Page images view////////////////////////////////////////////////


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[super viewWillAppear:NO];
    //[UIView setAnimationsEnabled:NO];

    NSLog(@"Called");
    // Set up the content size of the scroll view
    //[[UIDevice currentDevice] setValue:
     //[NSNumber numberWithInteger: UIInterfaceOrientationPortrait]
       //                         forKey:@"orientation"];

    self.sliderscroll.translatesAutoresizingMaskIntoConstraints=NO;
    
    //CGSize pagesScrollViewSize = self.sliderscroll.frame.size;
    //self.sliderscroll.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);

    
   // scrollproduct.translatesAutoresizingMaskIntoConstraints=NO;
    
    // Load the initial set of pages that are on screen
   // [self loadVisiblePages];
    
   // timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(loadVisiblePages) userInfo:nil repeats:YES];
   // [self sliderImgsServices];
    //[self loadVisiblePages];
    
}

#pragma mark -

- (void)loadVisiblePages{
    // First, determine which page is currently visible
   /*
   CGSize pagesScrollViewSize = self.sliderscroll.frame.size;
    //CGSize pagesScrollViewSize = [[UIScreen mainScreen] bounds].size;
    self.sliderscroll.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * self.pageImages.count, pagesScrollViewSize.height);
    */
    
    CGFloat pageWidth = [[UIScreen mainScreen] bounds].size.width;
   //  CGFloat pageWidth = self.sliderscroll.frame.size.width;
   // NSLog(@"pageWidth:%f",pageWidth);
    NSLog(@"UISCREEN:%.0f", [[UIScreen mainScreen] bounds].size.width);
    NSInteger page;
    
    /*
    //////////////////Scroll vertically////////////////////////////////////
    sliderscroll.translatesAutoresizingMaskIntoConstraints=NO;
    NSString* numwidth = [[NSString alloc]initWithFormat:@"%f",(pagesScrollViewSize.width * self.pageImages.count)];
     NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(self.sliderscroll.frame.size.height)];
    NSDictionary *views = @{@"sliderscroll":sliderscroll};
    NSDictionary *metrics = @{@"height" :numheight,@"width" :numwidth};
  [self.scroll_underview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[sliderscroll(height)]-0-|" options:kNilOptions metrics:metrics views:views]];
    [self.scroll_underview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[sliderscroll(width)]|" options:kNilOptions metrics:metrics views:views]];
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
     
     
    */
    
    //float widthofimg =
    NSLog(@"if loop:%f",self.sliderscroll.contentOffset.x);
  page = (NSInteger)floor(((self.sliderscroll.contentOffset.x) * 2.0f + pageWidth) / (pageWidth * 2.0f));
    // page = (NSInteger)floor((([self screenSize].width)*2.0f + pageWidth) / (pageWidth * 2.0f));
    //countscrollimgs++;
    NSLog(@"pageImages count:%d",(int)self.pageImages.count);
    /*
    if (countscrollimgs+1>self.pageImages.count) {
    countscrollimgs=0;
    }else{
        countscrollimgs++;
     NSLog(@"countscrollimgs else:%d",countscrollimgs);
    }
    */
    NSLog(@"page load:%ld",(long)page);
    NSLog(@"loadvisdi");
    // Update the page control
    self.pageController.currentPage = page;
    
    // Work out which pages we want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 2;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        NSLog(@"i value:%d",(int)i);
        [self loadPage:i];
    }
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
    /*
    [self.sliderscroll scrollRectToVisible:CGRectMake([self screenSize].width*countscrollimgs, 0, [self screenSize].width,self.sliderscroll.frame.size.height) animated:YES];
    
    if (countscrollimgs+1==sliderimgIds_arr.count) {
        countscrollimgs=0;
    }
    countscrollimgs++;
    */
    
    //[self performSelector:@selector(loadVisiblePages) withObject:nil afterDelay:2.0];
    //countscrollimgs++;
    NSLog(@"countscrollimgs:%d",countscrollimgs);
}

- (void)loadPage:(NSInteger)page {
    CGRect frame = self.sliderscroll.bounds;
    
    
    frame.origin.x = frame.size.width * page;
    
    
    NSLog(@"width page:%f",frame.size.width * page);
    frame.origin.y = 0.0f;
    
    
    
   // UIImageView *newPageView = [[UIImageView alloc] initWithFrame:CGRectMake([self screenSize].width*page, 0, [self screenSize].width, frame.size.height)];
    
    
    NSLog(@"imageURL check:%@",[self.pageImages objectAtIndex:page]);
    NSString*imgstr = [[NSString alloc]initWithFormat:@"%@",[self.pageImages objectAtIndex:page]];
    NSLog(@"imgstr:%@",imgstr);
    
    
    
    //NSData*data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imgstr]] returningResponse:nil error:nil];
    
    /*
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imgstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        //  self.product_big_imageview.image = [UIImage imageWithData:data];
        NSLog(@"iconbtn image set");
    //    [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
        [newPageView setImage:[UIImage imageWithData:data]];
    }];
    
    */
    
    //[newPageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgstr]]]];
    
    
    URLImageView *imageView = [[URLImageView alloc] initWithFrame:CGRectMake([self screenSize].width*page, 0, [self screenSize].width, frame.size.height)];
    [imageView startLoading:imgstr];
    
    NSLog(@"image ids:%@",[sliderimgIds_arr objectAtIndex:page]);
    [imageView setTag:page];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    //singleTap.numberOfTapsRequired = 1;
    [imageView setUserInteractionEnabled:YES];
    [imageView addGestureRecognizer:singleTap];
    
    singleTap=nil;
    
    NSLog(@"imge2");
    
    //newPageView.contentMode = UIViewContentModeScaleToFill;
    //[newPageView sizeThatFits:frame.size];
    //newPageView.contentMode = UIViewContentModeScaleToFill;
    NSLog(@"imge3");
    //newPageView.frame = frame;
    NSLog(@"newpageview frame:%f",imageView.frame.origin.x);
    NSLog(@"imge4");
    // [MBProgressHUD hideHUDForView:self.view animated:YES];
    [self.sliderscroll addSubview:imageView];
    NSLog(@"imge5");
    
    NSLog(@"imge6");
}


/*
- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    //[self performSelector:@selector(loadVisiblePages) withObject:nil afterDelay:2.0];
    // Load an individual page, first seeing if we've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.sliderscroll.bounds;
     //CGRect frame = [[UIScreen mainScreen] bounds];
        
        frame.origin.x = frame.size.width * page;
        //frame.origin.x = ([[UIScreen mainScreen] bounds].size.width)* page;
        
        NSLog(@"width page:%f",frame.size.width * page);
        frame.origin.y = 0.0f;
       
        
       // NSLog(@"pageNum:%lu",(unsigned long)page);
        //UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        UIImageView *newPageView = [[UIImageView alloc] initWithFrame:CGRectMake([self screenSize].width*page, 0, [self screenSize].width, frame.size.height)];
       //newPageView.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSLog(@"imageURL check:%@",[self.pageImages objectAtIndex:page]);
        NSString*imgstr = [[NSString alloc]initWithFormat:@"%@",[self.pageImages objectAtIndex:page]];
        NSLog(@"imgstr:%@",imgstr);
        
        
        
        NSData*data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imgstr]] returningResponse:nil error:nil];
        
        [newPageView setImage:[UIImage imageWithData:data]];
       //newPageView.image = [UIImage imageWithData:data];
 
        NSLog(@"image ids:%@",[sliderimgIds_arr objectAtIndex:page]);
        [newPageView setTag:page];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
        //singleTap.numberOfTapsRequired = 1;
        [newPageView setUserInteractionEnabled:YES];
        [newPageView addGestureRecognizer:singleTap];
        
        
        
        NSLog(@"imge2");
        
        //newPageView.contentMode = UIViewContentModeScaleToFill;
        //[newPageView sizeThatFits:frame.size];
       //newPageView.contentMode = UIViewContentModeScaleToFill;
                NSLog(@"imge3");
      //newPageView.frame = frame;
        NSLog(@"newpageview frame:%f",newPageView.frame.origin.x);
                NSLog(@"imge4");
        
        [self.sliderscroll addSubview:newPageView];
                NSLog(@"imge5");
               [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
                NSLog(@"imge6");
    }
 
}
*/
-(void)tapDetected:(UITapGestureRecognizer *)gestureRecognizer{
    if (onofftime==0) {
        [timer invalidate];}

    NSLog(@"single Tap on imageview:%@",gestureRecognizer);
    UIImageView*imageview =(UIImageView*)gestureRecognizer.view;
    NSLog(@"imageview check:%@",imageview);
    int idvalue = (int)imageview.tag;
    NSLog(@"idValue:%d",idvalue);
    NSLog(@"sliderimgsIds values:%@",sliderimgIds_arr);
   idvalue= [[sliderimgIds_arr objectAtIndex:idvalue]intValue];
    NSLog(@"idValue second:%d",idvalue);
    global_product_id=idvalue;

    ProductDetails*prddetails = [[ProductDetails alloc]init];
    [self presentViewController:prddetails animated:YES completion:nil];
    prddetails=nil;
    //[prddetails getProductsDetails:idvalue];

    
}

- (void)panRecognized:(UIPanGestureRecognizer *)sender
{
    NSLog(@"panRecognized");
    if (onofftime==0) {
        NSLog(@"panRecognized if");
        [timer invalidate];
        onofftime=1;
        
        //[self.sliderscroll removeGestureRecognizer:pangesture];
    }else{
        
        
        
        if (sender.state == UIGestureRecognizerStateBegan) {
            // you might want to do something at the start of the pan
        }
        
        CGPoint distance = [sender translationInView:self.sliderscroll]; // get distance of pan/swipe in the view in which the gesture recognizer was added
        CGPoint velocity = [sender velocityInView:self.sliderscroll]; // get velocity of pan/swipe in the view in which the gesture recognizer was added
        float usersSwipeSpeed = fabs(velocity.x); // use this if you need to move an object at a speed that matches the users swipe speed
        NSLog(@"swipe speed:%f", usersSwipeSpeed);
        
        if (sender.state == UIGestureRecognizerStateEnded) {
            [sender cancelsTouchesInView]; // you may or may not need this - check documentation if unsure
            if (distance.x > 0 && fabs(distance.x)>fabs(distance.y)) { // right
                NSLog(@"user swiped right");
                if (countscrollimgs==0) {
                    NSLog(@"countscrollimgs right if:%d",countscrollimgs);
                //countscrollimgs++;
                }else{
                    NSLog(@"countscrollimgs right else:%d",countscrollimgs);
                    countscrollimgs--;
                [self sliderManualCall];
                }
                
            } else if (distance.x < 0 && fabs(distance.x)>fabs(distance.y)) { //left
                NSLog(@"user swiped left");
                
                if (countscrollimgs==sliderimgIds_arr.count-1) {
                    NSLog(@"countscrollimgs left if:%d",countscrollimgs);
                    countscrollimgs=0;
                    [self sliderManualCall];
                }else{
                    NSLog(@"countscrollimgs left else:%d",countscrollimgs);
                    countscrollimgs++;
                    [self sliderManualCall];
                }
            }
            
        }
        
        /*
        if (scrollonoff==1) {
            scrollonoff=0;
            countscrollimgs=0;
        [self performSelector:@selector(sliderManualCall) withObject:nil afterDelay:0.2];
        }else{
        
        }
        */
        //[self sliderTimerCall];
      NSLog(@"panRecognized else");
       // scrollimgonce=1;
        //self loadVisiblePages];
    }
}



- (void)panRecognizedLatest:(UIPanGestureRecognizer *)sender
{
        NSLog(@"panRecognizedLatest");
        if (sender.state == UIGestureRecognizerStateBegan) {
            // you might want to do something at the start of the pan
        }
        
        CGPoint distance = [sender translationInView:self.sliderscroll]; // get distance of pan/swipe in the view in which the gesture recognizer was added
        CGPoint velocity = [sender velocityInView:self.sliderscroll]; // get velocity of pan/swipe in the view in which the gesture recognizer was added
        float usersSwipeSpeed = fabs(velocity.x); // use this if you need to move an object at a speed that matches the users swipe speed
        NSLog(@"swipe speed:%f", usersSwipeSpeed);
        
        if (sender.state == UIGestureRecognizerStateEnded) {
            [sender cancelsTouchesInView]; // you may or may not need this - check documentation if unsure
            if (distance.x > 0 && fabs(distance.x)>fabs(distance.y)) { // right
                NSLog(@"user swiped right");
              
                
            } else if (distance.x < 0 && fabs(distance.x)>fabs(distance.y)) { //left
                NSLog(@"user swiped left");
                if (valuelatestindex==[latestproductids_arr count]-1) {
                    reloads_latest_int=2;
                }else if(valuelatestindex<[latestproductids_arr count]-1){
                [self latestScrollCalled:valuelatestindex];
                    valuelatestindex++;
                }
              
            }
            
        }
        
}


- (void)panRecognizedRecent:(UIPanGestureRecognizer *)sender
{
    NSLog(@"panRecognizedRecent");
    
        if (sender.state == UIGestureRecognizerStateBegan) {
            // you might want to do something at the start of the pan
        }
        
        CGPoint distance = [sender translationInView:self.sliderscroll]; // get distance of pan/swipe in the view in which the gesture recognizer was added
        CGPoint velocity = [sender velocityInView:self.sliderscroll]; // get velocity of pan/swipe in the view in which the gesture recognizer was added
        float usersSwipeSpeed = fabs(velocity.x); // use this if you need to move an object at a speed that matches the users swipe speed
        NSLog(@"swipe speed:%f", usersSwipeSpeed);
        
        if (sender.state == UIGestureRecognizerStateEnded) {
            [sender cancelsTouchesInView]; // you may or may not need this - check documentation if unsure
            if (distance.x > 0 && fabs(distance.x)>fabs(distance.y)) { // right
                NSLog(@"user swiped right");
               
                
            } else if (distance.x < 0 && fabs(distance.x)>fabs(distance.y)) { //left
                NSLog(@"user swiped left");
                
                if (valuerecentindex==[recentlybrought_productsids count]-1) {
                    reloads_recent_int=2;
                }else if (valuerecentindex<[recentlybrought_productsids count]-1) {
                    [self recentScrollCalled:valuerecentindex];
                    valuerecentindex++;
                }
            }
            
        }
        
    
}






-(void)swipedGestureCalled:(UISwipeGestureRecognizer*)swipe{
    
}
- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    NSLog(@"rotated enter");
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
   // [self loadVisiblePages];
 
    NSArray*arrsliderimgs = [self.sliderscroll subviews];
    
    for (UIView*view in arrsliderimgs) {
        [view removeFromSuperview];
    }
    

    
    self.pageImages = nil;
    self.pageViews = nil;
   
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
            NSLog(@"rotated enter complet:%@",context);
      //[self viewDidLoad];
        
        
        if (self.view.bounds.size.height < self.view.bounds.size.width) {
            // self.heightCon.constant = self.view.bounds.size.height;
            NSLog(@"entere in landscape hjk:");
            //[self.mainscrollview setContentSize:CGSizeMake([self screenSize].width, [self screenSize].width)];
            
            NSString* viewheight_str = [[NSString alloc]initWithFormat:@"%f",[self screenSize].width];
            
            NSDictionary *views = @{@"scroll_underview":scroll_underview};
            NSDictionary *metrics = @{@"height" : viewheight_str};
            [self.mainscrollview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scroll_underview(height)]|" options:kNilOptions metrics:metrics views:views]];
            
            [self pagecontrolviews];
           //[self loadVisiblePages];
            //[self scrollViewDidScroll:self.sliderscroll];
            //[self.sliderscroll reloadInputViews];
            //for (NSInteger i = 0; i < self.pageImages.count; ++i) {
              //  [self loadPage:i];
            //}
            //[self.sliderscroll reloadInputViews];
            //[self.sliderscroll updateConstraints];
            //[self leftMenuHomeClick:nil];
            
        }else{
            [self pagecontrolviews];
            //self.heightCon.constant = 350;
            //[self pagecontrolviews];
            //[self loadVisiblePages];
            //[self leftMenuHomeClick:nil];
            NSLog(@"enter in portrait");
            
            
        }
        
        
        
        
        //[self.scrollproduct addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(width)]|" options:kNilOptions metrics:metrics views:views]];

        
        
        //[self viewDidLoad];
                
    }];
}



-(void)updateViewConstraints {
    [super updateViewConstraints];
    NSLog(@"updateViewConstraints");
    if (self.view.bounds.size.height < self.view.bounds.size.width) {
       // self.heightCon.constant = self.view.bounds.size.height;
        NSLog(@"entere in landscape:");
        
    }else{
        //self.heightCon.constant = 350;
    }
}

/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    //[self.view setTransform:CGAffineTransformMakeRotation(0)];
    //[self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
   [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    
}


-(BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    //return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortrait |UIInterfaceOrientationMaskPortraitUpsideDown;
    //or simply UIInterfaceOrientationMaskAll;
    NSLog(@"supportedInterfaceOrientations");
    return   UIInterfaceOrientationMaskPortrait;
}
 */
///////////////////////////////Slider Images Service///////////////////////////////////////////////////////
-(void)sliderImgsServices{
    
    NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/sliderimages/"];
    
    NSLog(@"str_country:%@",str_country);
    
   // NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
    NSMutableURLRequest*request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
    
    str_country=nil;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    request=nil;
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:%@",returnString);
    if (returnString==nil || returnString==NULL || [returnString isEqualToString:@""] || [returnString isEqual:nil]) {
        NSLog(@"Network Not Reachable");
    }else{
        returnString=nil;
    // NSDictionary *dict=[returnString JSONValue];
    NSError *jsonError;
   // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"Dict value:%@",dict);
    
    if (dict==nil||dict==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
    
    else {
        NSDictionary *create_result_dict;
        NSString *statuscode;
        NSString *message;
        
        statuscode = [dict objectForKey:@"statuscode"];
        message = [dict objectForKey:@"message"];
        NSLog(@"info:%@",[dict objectForKey:@"createResult"]);
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){

            //create_result_dict= [dict objectForKey:@"createResult"];
            NSArray*sliderarr = [dict objectForKey:@"createResult"];
            NSLog(@"slidercheck1:%@",sliderarr);
            create_result_dict = [sliderarr objectAtIndex:0];
            NSLog(@"create_result_dict:%@",create_result_dict);
            NSArray*sliderimgs_arr = [create_result_dict objectForKey:@"SliderImages"];
            NSLog(@"sliderimgs_arr:%@",sliderimgs_arr);
            NSArray*imgs_ids_arr = [dict objectForKey:@"ProductId"];
            NSLog(@"imgs_ids_arr:%@",imgs_ids_arr);
            sliders_img_arr = [[NSMutableArray alloc]init];
            sliderimgIds_arr = [[NSMutableArray alloc]init];
            NSLog(@"w1");
            for (int j=0; j<sliderimgs_arr.count; j++) {
            NSLog(@"w%d",j);
                NSDictionary*imagedict = [sliderimgs_arr objectAtIndex:j];
                NSDictionary*imageidsdict = [imgs_ids_arr objectAtIndex:j];
                [sliders_img_arr addObject:[imagedict objectForKey:@"image"]];
                [sliderimgIds_arr addObject:[imageidsdict objectForKey:@"id"]];
            }
            NSLog(@"w last");
            sliderimgs_arr=nil;
            create_result_dict=nil;
            imgs_ids_arr=nil;
            sliderarr=nil;
            dict=nil;
            [self performSelector:@selector(pagecontrolviews) withObject:nil afterDelay:0.5];
            
            NSLog(@"status 1 looo:%@",create_result_dict);
            
        }else if (status==2&&([message isEqualToString:@"Email and Password Authentication Error."]||[message isEqualToString:@"This customer email already exists"])){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            //[self checkUserUpdated];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    }
}

-(void)pagecontrolviews{
    self.pageImages = [NSArray arrayWithArray:sliders_img_arr];
    
    
    NSInteger pageCount = self.pageImages.count;
    
    // Set up the page control
   self.pageController.currentPage = 0;
    self.pageController.numberOfPages = pageCount;
    sliderscroll.delegate=self;
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    
    /*
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    */
    
    
    
   
    
    CGSize pagesScrollViewSize = self.sliderscroll.frame.size;
    //CGSize pagesScrollViewSize = [[UIScreen mainScreen] bounds].size;
    self.sliderscroll.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * self.pageImages.count, pagesScrollViewSize.height);
    for (NSInteger i = 0; i < self.pageImages.count; ++i) {
        [self loadPage:i];
    }
    [self viewWillAppear:YES];
    
}
///////////////////////////////////////////////////////////////////////////////////////////////
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   // if (scrollimgonce==1) {
     //   [self sliderscroll];
    //}

}

-(void)loginCheck{

}

/////////////////////////////////////////New Arrivals & Featured ////////////////////////////////////
-(void)latestHomeProducts{
    @try{
    
  //  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading.......";
    
   // NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/homepage/"];
        
         NSString *str_country = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/homepage/all/"];
    NSLog(@"str_country:%@",str_country);
    
   NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country]];
      //  NSMutableURLRequest*request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_country] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
        
        str_country=nil;
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
   // NSLog(@"returnData:%@",returnData);
        request=nil;
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
        //returnString=nil;
    
   //NSDictionary *dict=[returnString JSONValue];
    
   //NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:nil];
    
    NSError *jsonError;
   //NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
        
        returnData=nil;
    
    //NSString*val = [NSString stringWithFormat:@"%@",[dict objectForKey:@"statuscode"]];
    //NSLog(@"val check:%@",val);
       NSLog(@"dict:%@",dict);
    
        if ([returnString isEqualToString:@"**"]) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        }else{
            returnString=nil;
        
    if (dict==nil||dict==NULL)
    {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
       //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //[alert show];
        //[alert release];
    }else {
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1){
            
            NSLog(@"enter success block");
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            
           
           
            latest_product_price_arr = [[NSMutableArray alloc]init];
            latest_product_special_price_arr = [[NSMutableArray alloc]init];
            latest_product_name_arr = [[NSMutableArray alloc]init];
           latest_product_imgarr = [[NSMutableArray alloc]init];
            
            
            recently_product_price_arr = [[NSMutableArray alloc]init];
            recently_product_special_price_arr = [[NSMutableArray alloc]init];
            recently_product_name_arr = [[NSMutableArray alloc]init];
            recently_product_imgarr = [[NSMutableArray alloc]init];
           NSDictionary*tempDict = [dict objectForKey:@"createResult"];
            //NSDictionary*recentDict = [dict objectForKey:@"recentProduct"];
            
           // NSLog(@"");
            
            
            NSLog(@"tempDict:%@",tempDict);
            
            
            NSArray*arr1 = [tempDict objectForKey:@"LatestProducts"];
            NSLog(@"array chech1:%lu",(unsigned long)arr1.count);
            
            
            NSDictionary*latestnormaldict =[tempDict objectForKey:@"LatestProducts"];
            
            
            NSLog(@"latestnormaldict:%@",latestnormaldict);
           NSLog(@"latestnormaldict count:%lu",(unsigned long)latestnormaldict.count);
            
            int i=0;
            if (latestnormaldict.count!=0) {
                
            
            for(NSDictionary*locldict in latestnormaldict){
            
                [latestproductids_arr addObject:[locldict objectForKey:@"product_id"]];
                NSLog(@"locldictlatest:%@",locldict);
            NSString*product_name_str = [locldict objectForKey:@"name"];
                NSLog(@"product_name_str:%@",product_name_str);
            if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
            {
                product_name_str=@"Not Available";
            }
           [latest_product_name_arr addObject:product_name_str];
                //product_name_str=nil;
            
            NSString*product_url_str = [locldict objectForKey:@"imgurl"];
                NSLog(@"imgurl:%@",product_url_str);
            if ([product_url_str isEqualToString:@""]||[product_url_str isEqualToString:@"<null>"]||[product_url_str isEqualToString:@"null"]||[product_url_str isEqualToString:@"(null)"]||product_url_str ==nil||product_url_str==NULL)
            {
                product_url_str=@"Not Available";
            }
            [latest_product_imgarr addObject:product_url_str];
            
            
            NSString*product_price_str = [locldict objectForKey:@"price"];
            if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
            {
                product_price_str=@"Not Available";
            }
            [latest_product_price_arr addObject:product_price_str];
            
            NSString*product_specialprice_str = [locldict objectForKey:@"special_price"];
            NSLog(@"specail price check:%@",product_specialprice_str);
            /*
             if ([product_specialprice_str isEqualToString:@""]||[product_specialprice_str isEqualToString:@"<null>"]||[product_specialprice_str isEqualToString:@"null"]||[product_specialprice_str isEqualToString:@"(null)"]||product_specialprice_str ==nil||product_specialprice_str==NULL || [product_specialprice_str isKindOfClass:[NSNull class]]|| product_specialprice_str == (NSString *)[NSNull null] ||[product_specialprice_str isEqualToString:@"\"<null>\""])
             {
             product_specialprice_str=@"";
             }
             */
            [latest_product_special_price_arr addObject:product_specialprice_str];
            
            /*
            NSString*short_desc_str = [dictprodname objectForKey:@"short_description"];
            if ([short_desc_str isEqualToString:@""]||[short_desc_str isEqualToString:@"<null>"]||[short_desc_str isEqualToString:@"null"]||[short_desc_str isEqualToString:@"(null)"]||short_desc_str ==nil||short_desc_str==NULL)
            {
                short_desc_str=@"Not Available";
            }
            [latest_product_short_desc_arr addObject:short_desc_str];
            
            NSString*long_desc_str = [dictprodname objectForKey:@"description"];
            if ([long_desc_str isEqualToString:@""]||[long_desc_str isEqualToString:@"<null>"]||[long_desc_str isEqualToString:@"null"]||[long_desc_str isEqualToString:@"(null)"]||long_desc_str ==nil||short_desc_str==NULL)
            {
                long_desc_str=@"Not Available";
            }
            [latest_product_long_desc_arr addObject:long_desc_str];
            
            */
                
                
                if (arr1.count-1==latestproductids_arr.count) {
                    NSLog(@"arr1 count:%lu",(unsigned long)arr1.count);
                    NSLog(@"latestproductids_arr.count:%lu",(unsigned long)latestproductids_arr.count);
                    onCall=12;
                    [self displayLatestProductsInfo:valuelatestindex :product_url_str:product_name_str];
                    
                }else{
                    NSLog(@"else onCall latest");
                    onCall=0;
                }
                
                if (i<10) {
                    //onCall=12;
                    valuelatestindex=i;
           [self displayLatestProductsInfo:i :product_url_str:product_name_str];
                }
                i++;
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }else if(latestnormaldict.count==0){
                
                NSLog(@"latest is empty");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
            
            
            NSArray*arr2 = [tempDict objectForKey:@"RecentlyBrought"];
            NSLog(@"array chech2:%lu",(unsigned long)arr2.count);
            
            
            
            NSLog(@"tempdict:%@",tempDict);
             NSDictionary*recentnormaldict =[tempDict objectForKey:@"RecentlyBrought"];
             NSLog(@"recentnormaldict:%@",recentnormaldict);
            NSLog(@"recentnormaldict count:%lu",(unsigned long)recentnormaldict.count);
            // NSArray*arr2 = [tempDict objectForKey:@"RecentlyBrought"];
            //NSLog(@"array chech2:%lu",(unsigned long)arr2.count);
            int j=0;
            if (recentnormaldict.count!=0) {
                
            
            for(NSDictionary*localdict in recentnormaldict){
            NSLog(@"locldictrecent:%@",localdict);
                    
                
                [recentlybrought_productsids addObject:[localdict objectForKey:@"product_id"]];
                NSString*product_name_str = [localdict objectForKey:@"name"];
                NSLog(@"count of recently productsid:%lu",(unsigned long)recentlybrought_productsids.count);
                
                if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
                {
                    product_name_str=@"Not Available";
                }
                [recently_product_name_arr addObject:product_name_str];
                
                
                NSString*img_url_str = [localdict objectForKey:@"imgurl"];
                if ([img_url_str isEqualToString:@""]||[img_url_str isEqualToString:@"<null>"]||[img_url_str isEqualToString:@"null"]||[img_url_str isEqualToString:@"(null)"]||img_url_str ==nil||img_url_str==NULL)
                {
                    img_url_str=@"Not Available";
                }
                
               [recently_product_imgarr addObject:img_url_str];
                
                NSString*product_price_str = [localdict objectForKey:@"price"];
                if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
                {
                    product_price_str=@"Not Available";
                }
                [recently_product_price_arr addObject:product_price_str];
                
                NSString*product_specialprice_str = [localdict objectForKey:@"special_price"];
                
                 if ([product_specialprice_str isEqualToString:@""]||[product_specialprice_str isEqualToString:@"<null>"]||[product_specialprice_str isEqualToString:@"null"]||[product_specialprice_str isEqualToString:@"(null)"]||product_specialprice_str ==nil||product_specialprice_str==NULL || [product_specialprice_str isKindOfClass:[NSNull class]])
                 {
                 product_specialprice_str=@"";
                 }
                
                [recently_product_special_price_arr addObject:product_specialprice_str];
                NSLog(@"recent last");
                
                if (arr2.count-1==recentlybrought_productsids.count) {
                    //[MBProgressHUD hideHUDForView:self.view animated:YES];
                    NSLog(@"arr2 count:%lu",(unsigned long)arr1.count);
                    NSLog(@"recentlybrought_productsids:%lu",(unsigned long)recentlybrought_productsids.count);
                
                    onCall=12;
                    [self displayRecentlyProductsInfo:valuerecentindex :img_url_str :product_name_str];
                }else{
                    NSLog(@"else onCall recenet");
                    onCall=0;
                }
                
                
                if (j<10) {
                    //onCall=12;
                valuerecentindex=j;
                [self displayRecentlyProductsInfo:j :img_url_str :product_name_str];
                }
                j++;
                }
               [MBProgressHUD hideHUDForView:self.view animated:YES];
                dict=nil;
                tempDict=nil;
                recentnormaldict=nil;
                arr1=nil;
                arr2=nil;
                
                NSLog(@"stoploading.........");
           [MBProgressHUD hideHUDForView:self.view animated:YES];
            }else  if(recentnormaldict.count==0){
                NSLog(@"recent is empty");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
            
           // [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
        }
    }@catch(NSException*ex){
        NSLog(@"exception latest and recent:%@",ex);
    }
    
    
    // [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)latestScrollCalled:(int)indexvale{
    
    for (int k=indexvale; k<5*reloads_latest_int; k++) {
        [self displayLatestProductsInfo:k :[latest_product_imgarr objectAtIndex:k] :[latest_product_name_arr objectAtIndex:k]];
    }
    reloads_latest_int++;
}

-(void)recentScrollCalled:(int)indexvale{
    for (int k=indexvale; k<5*reloads_recent_int; k++) {
        [self displayRecentlyProductsInfo:k :[recently_product_imgarr objectAtIndex:k] :[recently_product_name_arr objectAtIndex:k]];
    }
    reloads_recent_int++;
}

-(void)displayRecentlyProductsInfo:(int)number :(NSString*)urlstr :(NSString*)productname{
    
    
   
    @try {
        
    
    
    int countRow=number;
    
    NSLog(@" recently 8 + (70 * countRow):%d",8 + (70 * countRow));
    
    
    //NSLog(@"wdth dynamic fdview :%d",(self.featuredscroll.frame.size.width * countRow+108));
   // UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(8 + (self.featuredview.frame.size.height * countRow),0 , self.featuredview.frame.size.height-10, self.featuredview.frame.size.height)];
        
        
        NSLog(@"self.featuredscroll width:%f",self.featuredscroll.frame.size.width);
        NSLog(@"self.featuredscroll height:%f",self.featuredscroll.frame.size.height);
        
        
         UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(8 + (self.featuredscroll.frame.size.height * countRow),0 , self.featuredscroll.frame.size.height-10, self.featuredscroll.frame.size.height)];
        
        
        UITapGestureRecognizer*tappedGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openProductDetails:)];
        [viewarrive setTag:[[recentlybrought_productsids objectAtIndex:number] intValue]];
        [viewarrive addGestureRecognizer:tappedGesture];

    [viewarrive setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
    
   // UILabel *prodname_lbl = [[UILabel alloc]initWithFrame:CGRectMake(viewarrive.frame.origin.x,5, 70, 21)];
      UILabel *prodname_lbl = [[UILabel alloc]init];
    prodname_lbl.text =productname;
        prodname_lbl.textAlignment = NSTextAlignmentCenter;
    prodname_lbl.adjustsFontSizeToFitWidth = YES;
   // prodname_lbl.font =[UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
        prodname_lbl.font = [UIFont systemFontOfSize:viewarrive.frame.size.width/20];
        prodname_lbl.lineBreakMode = NSLineBreakByWordWrapping;
        prodname_lbl.numberOfLines=0;
        
    //[prodname_lbl adjustsFontSizeToFitWidth];
    [prodname_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
        /*
     UILabel *prodsubname_lbl = [[UILabel alloc]initWithFrame:CGRectMake(18 + (37 * countRow) + (8 * countRow),15 , 70, 21)];
     prodsubname_lbl.text=@"SubPro1";
     prodsubname_lbl.adjustsFontSizeToFitWidth = YES;
     prodsubname_lbl.font =[UIFont fontWithName:@"Santor" size:8.0f];
     */
    
    
    
    
    //UIButton *iconbtn=[[UIButton alloc]initWithFrame:CGRectMake(18, 25, 40, 40)];
   // UIButton *iconbtn=[[UIButton alloc]init];
        /*
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        //  self.product_big_imageview.image = [UIImage imageWithData:data];
        NSLog(@"iconbtn image set");
        [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    }];
    */
    //iconbtn.tag = number;
   // [iconbtn setTag:[[recentlybrought_productsids objectAtIndex:number]intValue]];
   // iconbtn.layer.borderWidth=1.0;
   // iconbtn.layer.cornerRadius=2.0;
    // iconbtn.layer.borderColor = [UIColor clearColor].CGColor;
    //[iconbtn addTarget:self action:@selector(openProductDetailsRecent:) forControlEvents:UIControlEventTouchUpInside];
        
       // [iconbtn setTag:[[recentlybrought_productsids objectAtIndex:number] intValue]];
       // [iconbtn addGestureRecognizer:tappedGesture];
     //[iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    /*
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(18, 25, 40, 40)];
    
   // imageview.imageURL = [NSURL URLWithString:urlstr];
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        imageview.image = [UIImage imageWithData:data];
    }];
     */
        URLImageView *iconbtn = [[URLImageView alloc] init];
        [iconbtn startLoading:urlstr];
       // iconbtn.layer.borderWidth=1.0;
        //iconbtn.layer.cornerRadius=2.0;
        
        [iconbtn setTag:[[recentlybrought_productsids objectAtIndex:number] intValue]];
       // [iconbtn addGestureRecognizer:tappedGesture];
        [iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        int percnt = (([[recently_product_price_arr objectAtIndex:number] doubleValue]- [[recently_product_special_price_arr objectAtIndex:number]doubleValue])/[[recently_product_price_arr objectAtIndex:number] doubleValue])*100;
        
        NSLog(@"percentage price:%d",percnt);
        
        
    
    NSLog(@"count price recnetly:%lu",(unsigned long)[recently_product_price_arr count]);
    
   // UILabel *prodprice_lbl = [[UILabel alloc]initWithFrame:CGRectMake(12,65, 40, 21)];
      UILabel *prodprice_lbl = [[UILabel alloc]init];
    //prodprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs%.2f (%d %@)",[[recently_product_special_price_arr objectAtIndex:number]doubleValue],percnt,@"%"];
   // prodprice_lbl.text=@"90.00rs";
   // prodprice_lbl.textColor = [UIColor redColor];
         prodprice_lbl.textColor = [UIColor blueColor];
    prodprice_lbl.adjustsFontSizeToFitWidth = YES;
   // prodprice_lbl.font =[UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/18];
         prodprice_lbl.font =[UIFont systemFontOfSize:viewarrive.frame.size.width/18];
   
    [prodprice_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //NSString*sppricestr = [[NSString alloc]initWithFormat:@"Rs.%.2f",[[recently_product_price_arr objectAtIndex:number] doubleValue]];
    //NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:sppricestr];
    
    // making text property to strike text- NSStrikethroughStyleAttributeName
    //[titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
    
    
   // UILabel *prodspprice_lbl = [[UILabel alloc]initWithFrame:CGRectMake(45,65, 40, 21)];
    UILabel *prodspprice_lbl = [[UILabel alloc]init];
    //prodspprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs.%@",[recently_product_special_price_arr objectAtIndex:number]];
    // prodprice_lbl.text=@"90.00rs";
   // prodspprice_lbl.textColor = [UIColor grayColor];
         prodspprice_lbl.textColor = [UIColor redColor];
    prodspprice_lbl.adjustsFontSizeToFitWidth = YES;
    prodspprice_lbl.font =[UIFont systemFontOfSize:viewarrive.frame.size.width/18];
    //[prodspprice_lbl setAttributedText:titleString];
    [prodspprice_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        
        
        
        NSString*prodprice_str =[[NSString alloc]initWithFormat:@"Rs.%.2f",[[recently_product_price_arr objectAtIndex:number] doubleValue]];
        NSString*sppricestr = [[NSString alloc]initWithFormat:@"(Rs.%.2f)",[[recently_product_special_price_arr objectAtIndex:number] doubleValue]];
        
        if ([sppricestr isEqualToString:@"(Rs.0.00)"]) {
            
            NSLog(@"enter in if Rs.0.00");
            prodprice_lbl.text =[[NSString alloc]initWithFormat:@"Rs.%.2f",[[recently_product_price_arr objectAtIndex:number] doubleValue]];
            
            prodspprice_lbl.text=@"";
            
        }else{
            
            NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:prodprice_str];
            
            
            // making text property to strike text- NSStrikethroughStyleAttributeName
            [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
            
            
            prodprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs.%.2f  (%d%@)",[[recently_product_special_price_arr objectAtIndex:number] doubleValue],percnt,@"%"];
            //pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
            
            
            [prodspprice_lbl setAttributedText:titleString];
            
            titleString=nil;
            
        }
        
        
        
        
        
        
        
        /*
        UILabel*percentageprice_lbl = [[UILabel alloc]init];
        
        percentageprice_lbl.textColor = [UIColor blueColor];
        percentageprice_lbl.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
        percentageprice_lbl.text = [NSString stringWithFormat:@"%d",percnt];
        
        //[percentageprice_lbl setAttributedText:[NSString stringWithFormat:@"%d",percnt]];
        */
        
    /*
    UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //btnTempDelete.frame = CGRectMake(15,80 , 50, 21);
    btnTempDelete.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/15];
    [btnTempDelete setTitle:@"Buy" forState:UIControlStateNormal];
    btnTempDelete.tag = [[recentlybrought_productsids objectAtIndex:number] intValue];
    [btnTempDelete addTarget:self action:@selector(addToCartPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnTempDelete setTranslatesAutoresizingMaskIntoConstraints:NO];
    */
   // if((8 + (85 * countRow)+100)>=320){
    [viewarrive addSubview:prodspprice_lbl];
    [viewarrive addSubview:prodprice_lbl];
        //[viewarrive addSubview:percentageprice_lbl];
   // [viewarrive addSubview:btnTempDelete];
    //[viewarrive addSubview:imageview];
    [viewarrive addSubview:iconbtn];
    //[viewarrive addSubview:prodsubname_lbl];
    [viewarrive addSubview:prodname_lbl];
    
    NSLayoutConstraint *leadingConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodname_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *topConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:prodname_lbl attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
   
     NSLayoutConstraint *centerXpriceConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
     NSLayoutConstraint *centerXsppriceConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodprice_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerXbuyConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodspprice_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    
    
      //  NSLayoutConstraint * trailingpercent = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:percentageprice_lbl attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
       // NSLayoutConstraint * bottompercent = [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:percentageprice_lbl attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    //NSLayoutConstraint *btniconvertiConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    //NSLayoutConstraint *btniconwidthConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    //NSLayoutConstraint *btniconheightConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    
    
    NSDictionary *newviews = @{@"iconbtn":iconbtn,@"prodname_lbl":prodname_lbl,@"prodprice_lbl":prodprice_lbl,@"prodspprice_lbl":prodspprice_lbl};
    //float val =self.featuredscroll.frame.size.width*countRow;
    //NSLog(@"val dynmic:%f",val);
        
        
        
        if ([self screenSize].width<500) {
            NSString* num = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width-10)];
            NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/1.5];
            NSLog(@"num:%@",num);
            NSDictionary *newmetrics = @{@"width" : num,@"height" : numheight};
            
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-|" options:kNilOptions metrics:newmetrics views:newviews]];
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[prodname_lbl(width)]-5-|" options:kNilOptions metrics:newmetrics views:newviews]];
            //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[prodprice_lbl]-2-[prodspprice_lbl]-10-|" options:kNilOptions metrics:newmetrics views:newviews]];
            // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnTempDelete(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
            
            //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-2-[btnTempDelete]-2-|" options:kNilOptions metrics:newmetrics views:newviews]];
            
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-2-|" options:kNilOptions metrics:newmetrics views:newviews]];
            num=nil;
            numheight=nil;
            newmetrics=nil;
            

        }else{
        
            NSString* num = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width-40)];
            NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/1.5];
            NSLog(@"num:%@",num);
            NSDictionary *newmetrics = @{@"width" : num,@"height" : numheight};
            
    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
  [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[prodname_lbl(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
    //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[prodprice_lbl]-2-[prodspprice_lbl]-10-|" options:kNilOptions metrics:newmetrics views:newviews]];
   // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnTempDelete(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
    
    //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-2-[btnTempDelete]-2-|" options:kNilOptions metrics:newmetrics views:newviews]];
        
        [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];

    
       // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[percentageprice_lbl]-2-[btnTempDelete]-2-|" options:kNilOptions metrics:newmetrics views:newviews]];
   // NSDictionary *views = NSDictionaryOfVariableBindings(prodname_lbl,iconbtn);

    
   //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[prodname_lbl]-20-[iconbtn]-20-|" options:0 metrics:nil views:views]];
            
            
            num=nil;
            numheight=nil;
            newmetrics=nil;
            
        }
    
    //[viewarrive addConstraints:@[leadingConstraint,topConstraint,leadingbtniconConstraint,btniconvertiConstraint,btniconwidthConstraint,btniconheightConstraint]];
    [viewarrive addConstraints:@[leadingConstraint,topConstraint,centerXpriceConstraint,centerXsppriceConstraint,centerXbuyConstraint]];
    
    //[self.featuredview addSubview:viewarrive];
        [self.featuredscroll addSubview:viewarrive];
    
        if(onCall==12){
        NSLog(@"scroll enter recent");
       [MBProgressHUD hideHUDForView:self.view animated:YES];
        //[newarrivalsscroll setContentSize:CGSizeMake(8+(85*countRow)+20,128)];
            
            
        onCall=0;
            
       self.featuredscroll.translatesAutoresizingMaskIntoConstraints=NO;
        
            float lastviewarrivevalu = viewarrive.frame.origin.x+(viewarrive.frame.size.width);
            NSLog(@"lastviewarrivevalu:%f",lastviewarrivevalu);
            NSLog(@"lastviewarrivevalu width:%f",viewarrive.frame.size.width);
        NSDictionary *newviews = @{@"featuredview":self.featuredview};
            float val =self.featuredview.frame.size.width*(countRow/2);
            NSLog(@"val dynmic:%f",val);
        NSString* num = [[NSString alloc]initWithFormat:@"%f",lastviewarrivevalu];
        NSLog(@"num:%@",num);
        NSDictionary *newmetrics = @{@"width" : num};
        [self.featuredscroll addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[featuredview(width)]|" options:kNilOptions metrics:newmetrics views:newviews]];
         
       //     [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        NSLog(@"number featured value:%d",number);
            //[self.featuredscroll scrollRectToVisible:CGRectMake([self screenSize].width*countscrollimgs, 0, [self screenSize].width,self.sliderscroll.frame.size.height) animated:YES];

    //   [featuredscroll setContentSize:CGSizeMake((2*([self screenSize].width+20))*number,viewarrive.frame.size.height)];
            num=nil;
            newmetrics=nil;
            newviews=nil;
            
            NSLog(@"self.featuredscroll width:%f",self.featuredscroll.frame.size.width);
            /*
            if ([self screenSize].width>500) {
                if (self.featuredscroll.frame.size.width==320) {
                    NSLog(@"featured 320");
                    [self leftMenuHomeClick:nil];
                }
            }
             */
    }
        
        
        
        
        viewarrive=nil;
        newviews=nil;
        prodspprice_lbl=nil;
        prodprice_lbl=nil;
        iconbtn=nil;
        prodname_lbl=nil;
        leadingConstraint=nil;
        topConstraint=nil;
        centerXbuyConstraint=nil;
        centerXpriceConstraint=nil;
        centerXsppriceConstraint=nil;
        tappedGesture=nil;
    }
    @catch (NSException *exception) {
        NSLog(@"Exceptions recnetly:%@",exception);
    }
    @finally {
        
    }
    
}

-(void)displayLatestProductsInfo:(int)number :(NSString*)urlstr :(NSString*)productname{

    @try {
        
    
        
        
        
    int countRow=number;
    
    NSLog(@"latest8 + (70 * countRow):%d",8 + (70 * countRow));
   // UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(8 + (85 * countRow),0 , 80, 100)];
   
   // UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(8 + (self.newarrivalsview.frame.size.height * countRow),0 , self.newarrivalsview.frame.size.height-10, self.newarrivalsview.frame.size.height)];
     
        UIView *viewarrive = [[UIView alloc]initWithFrame:CGRectMake(8 + (self.newarrivalsscroll.frame.size.height * countRow),0 , self.newarrivalsscroll.frame.size.height-10, self.newarrivalsscroll.frame.size.height)];
        
        
        UITapGestureRecognizer*tappedGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openProductDetails:)];
        [viewarrive setTag:[[latestproductids_arr objectAtIndex:number] intValue]];
        [viewarrive addGestureRecognizer:tappedGesture];

    NSLog(@"check1");
    [viewarrive setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:1.0f]];
    
   // UILabel *prodname_lbl = [[UILabel alloc]initWithFrame:CGRectMake(8,5, 70, 21)];
    UILabel *prodname_lbl = [[UILabel alloc]init];
    prodname_lbl.text =productname;
    prodname_lbl.adjustsFontSizeToFitWidth = YES;
         prodname_lbl.font = [UIFont systemFontOfSize:viewarrive.frame.size.width/20];
       prodname_lbl.lineBreakMode = NSLineBreakByWordWrapping;
        prodname_lbl.numberOfLines=0;
        prodname_lbl.textAlignment = NSTextAlignmentCenter;
        
  // prodname_lbl.font =[UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/20];
   //[prodname_lbl adjustsFontSizeToFitWidth];
    [prodname_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
        //prodname_lbl.intrinsicContentSize.width;
       // prodname_lbl.intrinsicContentSize.width;

   /*
    UILabel *prodsubname_lbl = [[UILabel alloc]initWithFrame:CGRectMake(18 + (37 * countRow) + (8 * countRow),15 , 70, 21)];
    prodsubname_lbl.text=@"SubPro1";
    prodsubname_lbl.adjustsFontSizeToFitWidth = YES;
    prodsubname_lbl.font =[UIFont fontWithName:@"Santor" size:8.0f];
    */
    
   // UIButton *iconbtn=[[UIButton alloc]initWithFrame:CGRectMake(18, 25, 40, 40)];
    // UIButton *iconbtn=[[UIButton alloc]init];
    //[NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        //  self.product_big_imageview.image = [UIImage imageWithData:data];
     //   NSLog(@"iconbtn image set");
       // [iconbtn setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
    //}];
    
    //[iconbtn setTag:[[latestproductids_arr objectAtIndex:number] intValue]];
    //[iconbtn setTag:[[latestproductids_arr objectAtIndex:number]intValue]];
    //iconbtn.layer.borderWidth=1.0;
    //iconbtn.layer.cornerRadius=2.0;
    // iconbtn.layer.borderColor = [UIColor clearColor].CGColor;
   // [iconbtn addTarget:self action:@selector(openProductDetailsLatest:) forControlEvents:UIControlEventTouchUpInside];
      //  [iconbtn addGestureRecognizer:tappedGesture];
     //[iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    /*
    
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(18, 25, 40, 40)];
    
   // imageview.imageURL = [NSURL URLWithString:urlstr];
        NSLog(@"check2");
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        imageview.image = [UIImage imageWithData:data];
    }];
    */
        URLImageView *iconbtn = [[URLImageView alloc] init];
       // [iconbtn startLoading:urlstr];
       // iconbtn.layer.borderWidth=1.0;
        //iconbtn.layer.cornerRadius=2.0;
        
         [iconbtn setTag:[[latestproductids_arr objectAtIndex:number] intValue]];
        // [iconbtn addGestureRecognizer:tappedGesture];
        [iconbtn setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        
        int percnt = (([[latest_product_price_arr objectAtIndex:number] doubleValue]- [[latest_product_special_price_arr objectAtIndex:number]doubleValue])/[[latest_product_price_arr objectAtIndex:number] doubleValue])*100;
        
        NSLog(@"percentage price:%d",percnt);
    NSLog(@"indx number:%d",number);
        NSLog(@"count price latest:%lu",(unsigned long)[latest_product_price_arr count]);
    NSLog(@"arr price latest:%@",latest_product_price_arr);
    //UILabel *prodprice_lbl = [[UILabel alloc]initWithFrame:CGRectMake(12,65, 40, 21)];
    UILabel *prodprice_lbl = [[UILabel alloc]init];
    //prodprice_lbl.text =[[NSString alloc]initWithFormat:@"Rs%.2f (%d %@)",[[latest_product_price_arr objectAtIndex:number] doubleValue],percnt,@"%"];
        
       // prodprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs%.2f (%d %@)",[[recently_product_special_price_arr objectAtIndex:number]doubleValue],percnt,@"%"];
   // prodprice_lbl.text=@"90.00rs";
   // prodprice_lbl.textColor = [UIColor redColor];
        
    prodprice_lbl.textColor = [UIColor blueColor];
    prodprice_lbl.adjustsFontSizeToFitWidth = YES;
    //prodprice_lbl.font =[UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/18];
        prodprice_lbl.font =[UIFont systemFontOfSize:viewarrive.frame.size.width/18];
    [prodprice_lbl adjustsFontSizeToFitWidth];
    [prodprice_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
        
   // NSString*sppricestr = [[NSString alloc]initWithFormat:@"Rs.%.2f",[[latest_product_special_price_arr objectAtIndex:number] doubleValue]];
    //NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:sppricestr];
    
    // making text property to strike text- NSStrikethroughStyleAttributeName
    //[titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
 
    NSLog(@"latestchek1");
    //UILabel *prodspprice_lbl = [[UILabel alloc]initWithFrame:CGRectMake(45,65, 40, 21)];
    
    UILabel *prodspprice_lbl = [[UILabel alloc]init];
    //prodspprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs.%.2f",[[latest_product_price_arr objectAtIndex:number] doubleValue]];
    // prodprice_lbl.text=@"90.00rs";
   // prodspprice_lbl.textColor = [UIColor grayColor];
        
    prodspprice_lbl.textColor = [UIColor redColor];
    prodspprice_lbl.adjustsFontSizeToFitWidth = YES;
   // prodspprice_lbl.font =[UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/18];
         prodspprice_lbl.font =[UIFont systemFontOfSize:viewarrive.frame.size.width/18];
    //[prodspprice_lbl setAttributedText:titleString];
    [prodspprice_lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
        
    
        
        
        
        NSString*prodprice_str =[[NSString alloc]initWithFormat:@"Rs.%.2f",[[latest_product_price_arr objectAtIndex:number] doubleValue]];
        NSString*sppricestr = [[NSString alloc]initWithFormat:@"(Rs.%.2f)",[[latest_product_special_price_arr objectAtIndex:number] doubleValue]];
        
        if ([sppricestr isEqualToString:@"(Rs.0.00)"]) {
            
            NSLog(@"enter in if Rs.0.00");
            prodprice_lbl.text =[[NSString alloc]initWithFormat:@"Rs.%.2f",[[latest_product_price_arr objectAtIndex:number] doubleValue]];
            
            prodspprice_lbl.text=@"";
            
        }else{
            NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:prodprice_str];
            
            // making text property to strike text- NSStrikethroughStyleAttributeName
            [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
            prodprice_lbl.text = [[NSString alloc]initWithFormat:@"Rs.%.2f (%d%@)",[[latest_product_special_price_arr objectAtIndex:number] doubleValue],percnt,@"%"];
            //pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
            [prodspprice_lbl setAttributedText:titleString];
            
            titleString=nil;
            
        }
        prodprice_str=nil;
        sppricestr=nil;
        
     NSLog(@"latestchek2");
    /*
    UIButton *btnTempDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
    //btnTempDelete.frame = CGRectMake(15,80 , 50, 21);
     btnTempDelete.titleLabel.font = [UIFont fontWithName:@"Santor" size:viewarrive.frame.size.width/15];
    [btnTempDelete setTitle:@"Buy" forState:UIControlStateNormal];
    btnTempDelete.tag = [[latestproductids_arr objectAtIndex:number] intValue];
     //[btnTempDelete addTarget:self action:@selector(addToCartPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnTempDelete addTarget:self action:@selector(addToCartPage:) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"check3");
    [btnTempDelete setTranslatesAutoresizingMaskIntoConstraints:NO];
     */
    NSLog(@"latestcount:%lu",(unsigned long)latestproductids_arr.count);
    NSLog(@"numbercount:%d",number);
    /*
    if((8 + (85 * countRow)+100)>=320){
                NSLog(@"scroll enter latest");
        [featuredscroll setContentSize:CGSizeMake(8+(85*countRow)+20,128)];
    }
    */
    
    
    /*
    [viewarrive addSubview:btnTempDelete];
    [viewarrive addSubview:imageview];
    //[viewarrive addSubview:prodsubname_lbl];
    [viewarrive addSubview:prodname_lbl];
    [self.featuredview addSubview:viewarrive];
     */
    
    
    [viewarrive addSubview:prodspprice_lbl];
    [viewarrive addSubview:prodprice_lbl];
   // [viewarrive addSubview:btnTempDelete];
    [viewarrive addSubview:iconbtn];
   // [viewarrive addSubview:imageview];
    //[viewarrive addSubview:prodsubname_lbl];
    [viewarrive addSubview:prodname_lbl];
    
    
    NSLayoutConstraint *leadingConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodname_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *topConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:prodname_lbl attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    
    NSLayoutConstraint *centerXpriceConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerXsppriceConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodprice_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerXbuyConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:prodspprice_lbl attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    
    
    
    //NSLayoutConstraint *btniconvertiConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    //NSLayoutConstraint *btniconwidthConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    //NSLayoutConstraint *btniconheightConstraint= [NSLayoutConstraint constraintWithItem:viewarrive attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:iconbtn attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    
    
    
    NSDictionary *newviews = @{@"iconbtn":iconbtn,@"prodname_lbl":prodname_lbl,@"prodprice_lbl":prodprice_lbl,@"prodspprice_lbl":prodspprice_lbl};
    //float val =self.featuredscroll.frame.size.width*countRow;
    //NSLog(@"val dynmic:%f",val);
   
        
        if ([self screenSize].width<500) {
            NSString* num = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width-10)];
            NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/1.5];
            NSLog(@"num:%@",num);
            NSDictionary *newmetrics = @{@"width" : num,@"height" : numheight};
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[iconbtn(width)]-5-|" options:kNilOptions metrics:newmetrics views:newviews]];
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[prodname_lbl(width)]-5-|" options:kNilOptions metrics:newmetrics views:newviews]];
            // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[prodprice_lbl]-2-[prodspprice_lbl]-10-|" options:kNilOptions metrics:newmetrics views:newviews]];
            // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnTempDelete(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
            
            [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-2-|" options:kNilOptions metrics:newmetrics views:newviews]];
            num=nil;
            numheight=nil;
            newmetrics=nil;
            
        }else{
            NSString* num = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.width-40)];
            NSString* numheight = [[NSString alloc]initWithFormat:@"%f",(viewarrive.frame.size.height)/1.5];
            NSLog(@"num:%@",num);
            NSDictionary *newmetrics = @{@"width" : num,@"height" : numheight};
    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[iconbtn(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[prodname_lbl(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
   // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[prodprice_lbl]-2-[prodspprice_lbl]-10-|" options:kNilOptions metrics:newmetrics views:newviews]];
   // [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btnTempDelete(width)]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
    
    [viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[prodname_lbl]-5-[iconbtn(height)]-2-[prodprice_lbl]-2-[prodspprice_lbl]-20-|" options:kNilOptions metrics:newmetrics views:newviews]];
            num=nil;
            numheight=nil;
            newmetrics=nil;

        }
    
    // NSDictionary *views = NSDictionaryOfVariableBindings(prodname_lbl,iconbtn);
    
    
    //[viewarrive addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[prodname_lbl]-20-[iconbtn]-20-|" options:0 metrics:nil views:views]];
    
    
    //[viewarrive addConstraints:@[leadingConstraint,topConstraint,leadingbtniconConstraint,btniconvertiConstraint,btniconwidthConstraint,btniconheightConstraint]];
    [viewarrive addConstraints:@[leadingConstraint,topConstraint,centerXpriceConstraint,centerXsppriceConstraint,centerXbuyConstraint]];
    
     [iconbtn startLoading:urlstr];
    
   // [self.newarrivalsview addSubview:viewarrive];
         [newarrivalsscroll addSubview:viewarrive];
    

   if(onCall==12){
        NSLog(@"scroll enter latest");
        //[newarrivalsscroll setContentSize:CGSizeMake(8+(85*countRow)+20,128)];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
        onCall=0;
       
        self.newarrivalsscroll.translatesAutoresizingMaskIntoConstraints=NO;
        
        NSDictionary *newviews = @{@"newarrivalsview":self.newarrivalsview};
        NSLog(@"countrow val:%d",countRow);
        NSLog(@"self.newarrivalsview.frame.size.width:%f",self.newarrivalsview.frame.size.width);
        float val =self.newarrivalsview.frame.size.width*(countRow/2);
         float lastviewarrivevalu = viewarrive.frame.origin.x+(viewarrive.frame.size.width);
        NSLog(@"val dynmic:%f",val);
        NSString* num = [[NSString alloc]initWithFormat:@"%f",lastviewarrivevalu];
        NSLog(@"num:%@",num);
        NSDictionary *newmetrics = @{@"width" : num};
        [self.newarrivalsscroll addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[newarrivalsview(width)]|" options:kNilOptions metrics:newmetrics views:newviews]];
       
        
         NSLog(@"number newarrivalsscroll value:%d",number);
        
     //   [newarrivalsscroll setContentSize:CGSizeMake((2*([self screenSize].width+20))*number,viewarrive.frame.size.height)];
        
        
        newmetrics=nil;
        newviews=nil;
        num=nil;
        
    }
        
        
        viewarrive=nil;
        newviews=nil;
        prodspprice_lbl=nil;
        prodprice_lbl=nil;
        iconbtn=nil;
        prodname_lbl=nil;
        leadingConstraint=nil;
        topConstraint=nil;
        centerXbuyConstraint=nil;
        centerXpriceConstraint=nil;
        centerXsppriceConstraint=nil;
        
        tappedGesture=nil;
        
       // [newarrivalsscroll setContentSize:CGSizeMake(([self screenSize].width+20)*number,viewarrive.frame.size.height)];
    }
    @catch (NSException *exception) {
        NSLog(@"excpetion ui for recently:%@",exception);
    }
    @finally {
        NSLog(@"Finally");
    }
}

-(void)openProductDetails:(UITapGestureRecognizer*)gestureRecognizer{
    if (onofftime==0) {
        [timer invalidate];}
    UIView*tempView = (UIView*)gestureRecognizer.view;
    NSLog(@"tempView:%@",tempView);
    int value = (int)tempView.tag;
    global_product_id = value;
    //[self callProductDetails];
    
    [self callProductDetailsPage];
}

-(void)callProductDetailsPage{

   // ProductDetails *pd = [[ProductDetails alloc]initWithNibName:@"ProductDetails" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:pd animated:NO];
    ProductDetails *pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
    pd=nil;

}

////////////////////////////////////////////////End//////////////////////////////////////////////////////////////////////////
- (IBAction)addToCartPage:(id)sender{
    
    NSLog(@"add cart ID");
    quantity_str=@"1";
    tappedButton_addcart_btn = (UIButton*)sender;
    addcartcheckint=1;
    [cvc cartCreateIfNotExist];
    NSLog(@"finished load addcart");
    if (cartcountvalue==0) {
        self.cartitemscount_btn.hidden=YES;
    }else{
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        self.cartitemscount_btn.hidden=NO;
    }
    
    //[self getCartCountValue];
    //CartVC *cartview = [[CartVC alloc]initWithNibName:@"CartVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:cartview animated:YES];
}

-(void)openCartPage{

    //cvc = [[CartVC alloc]initWithNibName:@"CartVC" bundle:[NSBundle mainBundle]];
    addcartcheckint=2;
   // cvc = [[CartVC alloc]init];
    [self presentViewController:cvc animated:YES completion:nil];
    cvc=nil;
    //[self removeunrefferenceobjects];
    //[self dealloc];

}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"response:%@",response);
}

-(void)aftersignupcall{

    NSLog(@"aftersignupsrname:%@",aftersignupsrname);
        NSLog(@"aftersignupsrpass:%@",aftersignupsrpass);
    //emailid_txtfield.text = aftersignupsrname;
    //pass_txtfield.text = aftersignupsrpass;
   // [self login_call];
    //[self performSelector:@selector(login_call) withObject:nil afterDelay:1.5];
    
    

}

- (IBAction)clickedMoreNewArrival:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    pageIdentify_str = @"ProductsViewController";
    global_clicked_more=@"latest";
    switchpage=1;
   // global_productid_arr = [[NSMutableArray alloc]initWithArray:latestproductids_arr];
    [self callCategoryProductsView];
}

- (IBAction)clickedMoreFeatured:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    pageIdentify_str = @"ProductsViewController";
    switchpage=1;
    global_clicked_more=@"recent";
  //  global_productid_arr = [[NSMutableArray alloc]initWithArray:recentlybrought_productsids];
    [self callCategoryProductsView];
}

-(void)callCategoryProductsView{
    //CategoryProductsView *cpv = [[CategoryProductsView alloc]initWithNibName:@"CategoryProductsView" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:cpv animated:NO];
    CategoryProductsView *cpv = [[CategoryProductsView alloc]init];
    [self presentViewController:cpv animated:YES completion:nil];
    cpv=nil;
}
/*
-(void)insertlogin_db
{
    sqlite3_stmt *stmt3;
    //char *errorMsg4;
    char *update4 = "insert into login values (?,?,?,?,?);";
    NSLog(@"Insert query:%s",update4);
    int x1 = sqlite3_prepare_v2(database, update4, -1, &stmt3, nil);
    NSLog(@"x1:%d",x1);
    if (x1 == SQLITE_OK)
    {
        sqlite3_bind_text(stmt3, 1, NULL,-1, NULL);
        sqlite3_bind_text(stmt3, 2, [logged_user_id UTF8String],-1, NULL);
         sqlite3_bind_text(stmt3, 3, [logged_username UTF8String],-1, NULL);
        sqlite3_bind_text(stmt3, 4, [login_pass_str UTF8String],-1, NULL);
        sqlite3_bind_text(stmt3, 5,[global_email_store UTF8String], -1, NULL);
    }
    //logged_user_id = [[NSString alloc]initWithFormat:@"%@",user_id_str];
    //logged_username=[[NSString alloc]initWithFormat:@"%@",firstname_str];
    if (sqlite3_step(stmt3) != SQLITE_DONE)
        //NSLog(@"Error: %",errorMsg4);
        sqlite3_finalize(stmt3);
    
    user_id_str=Nil;
    firstname_str=Nil;
    login_pass_str=Nil;
    logged_name_str=Nil;
    
    // callMessageByTimer = [NSTimer scheduledTimerWithTimeInterval:60.0 target:self selector:@selector(callMessage) userInfo:nil repeats:YES];
    
    
}
*/
-(void)readlogin
{
    NSLog(@"Entered in read login");
    NSString *query = [[NSString alloc] initWithFormat:@"select * from login;"];
    sqlite3_stmt *stmt;
    int x = sqlite3_prepare_v2(database,[query UTF8String],-1, &stmt, nil);
    if (x == SQLITE_OK)
    {
        NSLog(@"enter in SQLITE_OK");
        @try {
            
        // Loop through the results and add them to the feeds array
        while(sqlite3_step(stmt) == SQLITE_ROW)
        {
            
            NSLog(@"SQLITE_ROW");
            
            NSString *loginid_str = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 1)];
            NSLog(@"loginstr:%@",loginid_str);
            logged_user_id = [[NSString alloc]initWithFormat:@"%@",loginid_str];
            
            NSString *loginstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 2)];
            NSLog(@"loginstr:%@",loginstr);
            logged_username=[[NSString alloc]initWithFormat:@"%@",loginstr];
            
            logged_name_str = [[NSString alloc]initWithFormat:@"%@",loginstr];
            NSString *loginpassstr = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 3)];
            logged_password=[[NSString alloc]initWithFormat:@"%@",loginpassstr];
            logged_user_pass = [[NSString alloc]initWithFormat:@"%@",loginpassstr];
                        NSLog(@"loginpass:%@",loginpassstr);
            
            global_email_store = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(stmt, 4)];
            NSLog(@"global_email_store:%@",global_email_store);
        }
            
            
        }
        @catch (NSException *exception) {
            NSLog(@"Exception DB:%@",exception);
        }
        @finally {
            NSLog(@"entered in final block");
        }
        
    }
    sqlite3_finalize(stmt);
    if ([logged_username isEqualToString:@""]||[logged_username isEqualToString:@"<null>"]||[logged_username isEqualToString:@"null"]||[logged_username isEqualToString:@"(null)"]||logged_username ==nil||logged_username==NULL)
    {
        global_email_store=nil;
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
                self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);
       // self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , [self screenSize].height/4);
        
        [self.left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
        [self.leftmenulist_view addSubview:self.show_user_not_log_view];

        NSLog(@"width of view:%f",self.leftmenu_underview.frame.size.width);
    global_user_logedin_status=@"Yes";
    //NSLog(@"username readlogin database:%@",logged_username);
      //  NSLog(@"logged_username name:%@",logged_username);
    //emailid_txtfield.text = global_email_store;
    //pass_txtfield.text = logged_password;
   // NSLog(@"emailid_txtfield readlogin:%@",emailid_txtfield.text);
    }else{
        
        
        //self.leftmenu_underview.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , [self screenSize].height/4);
        
        //[self.leftmenulist_view addSubview:self.leftmenu_underview];
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [self.leftmenu_underview addGestureRecognizer:tap];
        tap=nil;

    }
    //if (![logged_username isEqual:[NSNull null]]) {
     // [self performSelector:@selector(checkUserlogininDB) withObject:nil afterDelay:1.5];
    //}
   //
    NSLog(@"username readlogin database:%@",logged_username);
    NSLog(@"logged_username name:%@",logged_username);

    [self loginInfoToUi];
}


-(void)callMyAccountPage{
    //if (onofftime==0) {
        [timer invalidate];
    //}

   // MyAccountView*mmyacct = [[MyAccountView alloc]initWithNibName:@"MyAccountView" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:mmyacct animated:NO];
    
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
    
   // [self dealloc];

}


-(void)loginInfoToUi{
    /////////////////////////////////////////////////////////////////////
    
    if ([logged_name_str isEqualToString:@""]||[logged_name_str isEqualToString:@"(null)"]||logged_name_str==nil||logged_name_str==NULL) {
        left_menu_profile_name.hidden=YES;
        left_menu_profile_email_lbl.hidden=YES;
        [left_menu_logout_btn setTag:1];
        [left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
    }else{
        left_menu_profile_name.text = logged_username;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        left_menu_profile_name.adjustsFontSizeToFitWidth=YES;
        
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/30];
        left_menu_profile_email_lbl.adjustsFontSizeToFitWidth=YES;
        [left_menu_logout_btn setTag:2];
    }


}



-(void)show_popup_login
{
    /*
    login_check_view.hidden=NO;
    NSLog(@"show_popup_login enter");
    login_check_view.alpha=0.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    login_check_view.alpha=1.0;
    [UIView commitAnimations];
    */
    
}

-(void)close_popup_login
{
    /*
    // username_txtfield.text =@"";
    //pass_txtfield.text=@"";
    login_check_view.alpha=1.0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    login_check_view.alpha=0.0;
    [UIView commitAnimations];
     */
}

- (void)didReceiveMemoryWarning {
    [self removeunrefferenceobjects];
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    
    
    NSLog(@"delloac called");
   //[_products_bar_lbl release];
    //[products_tblview release];
    [_forgot_btn_link release];
    //[_sliderscroll release];
    [_pageController release];
   //[_newarrivalsscroll release];
    //[_featuredscroll release];
    
    [leftmenulist_view release];
    [left_menu_profile_img release];
    [left_menu_profile_name release];
    [left_menu_profile_email_lbl release];
    [left_menu_home_btn release];
    [left_menu_category_btn release];
    [left_menu_brand_btn release];
    [left_menu_promotions_btn release];
    [left_menu_polices_btn release];
    [left_menu_contact_btn release];
    [left_menu_logout_btn release];
    //[leftMenuCategoryClick release];
    
    [logout_btn release];
    [_show_user_not_log_view release];
    [_leftmenu_underview release];
    [_dentistkartname_lbl release];
    [_cartitemscount_btn release];
   // [_topBarDentistkartView release];
    [_left_menu_profile_image release];
    [_mainscrollview release];
    [_dentistkart_lbl release];
    [_dentalmegastore_lbl release];
    [_closemenu_btn release];
    [_recently_brought_lbl release];
    [_latest_products_lbl release];
    [_more_recent_btn release];
    [_more_latest_btn release];
    [self removeunrefferenceobjects];
    [super dealloc];
}

-(void)removeunrefferenceobjects{
    product_id_arr=nil;
    product_imgurl_arr=nil;
    product_name_arr=nil;
    product_usercost_arr=nil;
    prodimages_glb_arr=nil;
    latest_product_imgarr=nil;
    latest_product_long_desc_arr=nil;
    latest_product_name_arr=nil;
    latest_product_price_arr=nil;
    latest_product_short_desc_arr=nil;
    latest_product_special_price_arr=nil;
    latestproductids_arr=nil;
    cvc=nil;
    recently_product_imgarr=nil;
    recently_product_long_desc_arr=nil;
    recently_product_name_arr=nil;
    recently_product_price_arr=nil;
    recently_product_short_desc_arr=nil;
    recently_product_special_price_arr=nil;
    recentlybrought_productsids=nil;
    //logged_name_str=nil;
    //logged_user_id=nil;
    self.pageImages=nil;
    self.pageViews=nil;
    

}
- (IBAction)promotions_btn_click:(id)sender {
    NSLog(@"enter promotions");
    if ([global_user_logedin_status isEqualToString:@"No"]) {
         NSLog(@"User has not logged In");
    [self show_popup_login];
    }else if ([global_user_logedin_status isEqualToString:@"Yes"]){
        NSLog(@"Already User Logged In");
    
    }
    /*
    LoginViewController *login_vc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:login_vc animated:YES];
    */
    
}

- (IBAction)products_btn_click:(id)sender {
    
    NSLog(@"entered in products");
    if ([global_user_logedin_status isEqualToString:@"No"]) {
         NSLog(@"User has not logged In");
        [self show_popup_login];
    }else if ([global_user_logedin_status isEqualToString:@"Yes"]){
        NSLog(@"Already User Logged In");
        
    }

}

- (IBAction)orders_btn_click:(id)sender {
    NSLog(@"entered in products");
    if ([global_user_logedin_status isEqualToString:@"No"]) {
          NSLog(@"User has not logged In");
        [self show_popup_login];
    }else if ([global_user_logedin_status isEqualToString:@"Yes"]){
        NSLog(@"Already User Logged In");
        MyOrdersVC *movc = [[MyOrdersVC alloc]init];
        
        [self presentViewController:movc animated:YES completion:nil];

    }
}

-(void)logOut{


    sqlite3_stmt *stmt2;
    NSString *update;
    
    
    update=[[NSString alloc]initWithFormat:@"delete from login;"];
    
    NSLog(@"upadte:%@",update);
    int x = sqlite3_prepare_v2(database, [update UTF8String], -1, &stmt2, nil);
    NSLog(@"x=%d",x);
    [self removecart];
    if (sqlite3_step(stmt2) != SQLITE_DONE)
        NSLog(@"Deletion Error.");
    sqlite3_finalize(stmt2);
    
    global_user_logedin_status=@"No";
    
    /*
    logout_btn.hidden=YES;
    //logout_btn.hidden=NO;
    
    
    profile_dropdw_imgview.hidden=YES;
    usernme_imgicon_imgview.hidden=NO;
    profile_btn.hidden=YES;
    logoutimgicon_imgview.hidden=YES;
usernme_imgicon_imgview.image = [UIImage imageNamed:@"login.png"];
    [login_or_signup_btn setTitle:@"Login/Signup" forState:UIControlStateNormal];
    logged_usrname_show_lbl.hidden=YES;
     */
    
    logged_user_id=nil;
    logged_username=nil;
    logged_password=nil;
    global_email_store=nil;
    [self readlogin];
    self.leftmenulist_view.hidden=YES;
    [self.left_menu_logout_btn setTag:1];
    [self.left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
    
    //[self.leftmenulist_view setNeedsDisplay];
   // [self viewDidLoad];
    //[self performSelector:@selector(reloadProductsView) withObject:self afterDelay:1.5];
    


}

-(void)removecart{
    
    
    sqlite3_stmt *stmt2;
    NSString *update;
    
    
    update=[[NSString alloc]initWithFormat:@"delete from cart;"];
    //update=[[NSString alloc]initWithFormat:@"DROP TABLE cart;"];
    
    NSLog(@"upadte:%@",update);
    int x = sqlite3_prepare_v2(database, [update UTF8String], -1, &stmt2, nil);
    NSLog(@"x=%d",x);
    if (sqlite3_step(stmt2) != SQLITE_DONE)
        NSLog(@"Deletion Error.");
    sqlite3_finalize(stmt2);
    cartcountvalue=0;
    cartid_check=nil;
    [self getCartCountValue];
    
}




-(void)reloadProductsView{
   // ProductsViewController *pvc = [[ProductsViewController alloc]initWithNibName:@"ProductsViewController" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:pvc animated:NO];
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];

}

- (IBAction)forgot_pass_click:(id)sender {
    
    ForgotPassVC *fpvc = [[ForgotPassVC alloc]init];
    
    [self presentViewController:fpvc animated:YES completion:nil];
}

- (IBAction)signup_link_click:(id)sender {
    NSLog(@"Signuppage");
    RootViewController *signup_view = [[RootViewController alloc]init];
    [self presentViewController:signup_view animated:YES completion:nil];
    NSLog(@"After");
}

- (IBAction)login_btn_click:(id)sender {
    
    [self performSelector:@selector(checkUserloginin) withObject:nil afterDelay:0.5];
}

- (IBAction)show_pass_btn_click:(id)sender {
    
    UIButton *tappedButton = (UIButton*)sender;
    
    if (tappedButton.tag==1)
    {
        tappedButton.tag=2;
        [show_pass_btn setImage:[UIImage imageNamed:@"click_new.png"] forState:UIControlStateNormal];
        pass_txtfield.secureTextEntry=NO;
       
    }
    else if (tappedButton.tag==2)
    {
        tappedButton.tag=1;
        [show_pass_btn setImage:[UIImage imageNamed:@"unclick_new.png"] forState:UIControlStateNormal];
        
        pass_txtfield.secureTextEntry=YES;
    }
}

- (IBAction)close_login_view:(id)sender {
    
    [self close_popup_login];
}

- (IBAction)logoutUser:(id)sender {

    [self logOut];
}


-(void)dismissKeyboardPopup{
    [emailid_txtfield resignFirstResponder];
    [pass_txtfield resignFirstResponder];
    
    drop_down_view.hidden=YES;
    leftmenulist_view.hidden=YES;
    [self close_popup_login];
    
    
}

- (IBAction)dissmisKeyboard:(id)sender {
    
    [self dismissKeyboardPopup];
   // [sender resignFirstResponder];
}



- (IBAction)login_signup_click:(id)sender {
    
    if([global_user_logedin_status isEqualToString:@"No"]){
    [self show_popup_login];
        
    }else if ([global_user_logedin_status isEqualToString:@"Yes"]){
    
    }
}



- (IBAction)drop_down_click_user:(id)sender {
    
    //if ([logged_user_id isEqualToString:@"(null)"]||[logged_user_id isEqualToString:@""]||logged_user_id==nil||logged_user_id==NULL)
    //{
        NSLog(@"drop_down_click_user:%@",logged_user_id);
        //[self show_popup_login];
        //[self logOut];
    
    //}else{
        //[self close_popup_login];
        UIButton*tappedButton =  (UIButton*)sender;
        
        if(tappedButton.tag ==1){
            //drop_down_view.hidden=NO;
            leftmenulist_view.hidden=NO;
            self.closemenu_btn.hidden=NO;
            [drop_down_btn_pro setTag:2];
            
        }else if(tappedButton.tag ==2){
            [drop_down_btn_pro setTag:1];
            //drop_down_view.hidden=YES;
            self.closemenu_btn.hidden=YES;
            leftmenulist_view.hidden=YES;
        }
    //}
}

-(void)login{
    //LoginViewController *lvc = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:lvc animated:NO];
    
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}

///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    
    //ProductsViewController *pvc = [[ProductsViewController alloc]initWithNibName:@"ProductsViewController" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:pvc animated:NO];
    ProductsViewController *pvc = [[[ProductsViewController alloc]init]autorelease];
    [self presentViewController:pvc animated:YES completion:nil];
    [pvc release];
}

- (IBAction)leftMenuCategoryClick:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    switchpage=2;
    isBrands=NO;
    [self callCategoriesPage];
}

- (IBAction)leftMenuBrandsClick:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    isBrands=YES;
    [self callCategoriesPage];
    
}

- (IBAction)leftMenuPromotionClick:(id)sender {
    //[self callDentistKartInfo];
   // PromotionsVC*promo = [[PromotionsVC alloc]initWithNibName:@"PromotionsVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:promo animated:NO];
    
    PromotionsVC*promo = [[[PromotionsVC alloc]init]autorelease];
    [self presentViewController:promo animated:YES completion:nil];
    [promo release];
}

- (IBAction)leftMenuPolicesClick:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    [self callDentistKartInfo];
}

- (IBAction)leftMenuContactusClick:(id)sender {
    //[self callDentistKartInfo];
    if (onofftime==0) {
        [timer invalidate];}

   // ContactUsVC * cuvc = [[ContactUsVC alloc]initWithNibName:@"ContactUsVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:cuvc animated:NO];
    ContactUsVC * cuvc = [[[ContactUsVC alloc]init]autorelease];
    [self presentViewController:cuvc animated:YES completion:nil];
    [cuvc release];
}
-(void)callDentistKartInfo{
    if (onofftime==0) {
        [timer invalidate];}

    //DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]initWithNibName:@"DeintistkartInfoVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:hpi animated:NO];
    
    DeintistkartInfoVC *hpi = [[[DeintistkartInfoVC alloc]init]autorelease];
    [self presentViewController:hpi animated:YES completion:nil];
    [hpi release];
}

-(void)callCategoriesPage{
    if (onofftime==0) {
        [timer invalidate];}

   // CategoriesViewController*cvclocal = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:cvclocal animated:NO];
    
    CategoriesViewController*cvclocal = [[[CategoriesViewController alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];


}
- (IBAction)leftMenuLogoutClick:(id)sender {
    UIButton*tapped = (UIButton*)sender;
    if (tapped.tag==1) {
        [self login];
    }else if (tapped.tag==2){
        [self logOut];
    }
}
- (IBAction)logoutCall:(id)sender {
}
- (IBAction)searchClick:(id)sender {
}

- (IBAction)cartPageClick:(id)sender {
    addcartcheckint=2;
    cartpageopen_str=@"read";
     pageIdentify_str=@"ProductsViewController";
    NSLog(@"onofftime cart:%d",onofftime);
    if (onofftime==0) {
        [timer invalidate];}

    [self openCartPage];
}
- (IBAction)searchBtnClick:(id)sender {
    if (onofftime==0) {
        [timer invalidate];}

    pageIdentify_str=@"ProductsViewController";
   // SearchVC*svc = [[SearchVC alloc]initWithNibName:@"SearchVC" bundle:[NSBundle mainBundle]];
    //[self.navigationController pushViewController:svc animated:NO];
    
    SearchVC*svc = [[[SearchVC alloc]init]autorelease];
    [self presentViewController:svc animated:YES completion:nil];
    [svc release];
}
- (IBAction)closeMenuOutSide:(id)sender {
    NSLog(@"close menu");
    [drop_down_btn_pro setTag:1];
    self.leftmenulist_view.hidden=YES;
    self.closemenu_btn.hidden=YES;
}
@end




