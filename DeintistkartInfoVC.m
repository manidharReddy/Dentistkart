//
//  DeintistkartInfoVC.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 20/02/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "DeintistkartInfoVC.h"
#import "MBProgressHUD.h"

//#import "QuartzCore/QuartzCore.h"
#import "FakeModelBuilder.h"
#import "MenuSectionHeaderView.h"
#import "AppDelegate.h"
#import "CategoryProductsView.h"
#import "ProductsViewController.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "CategoriesViewController.h"
#import "PolicyCell.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
@interface DeintistkartInfoVC ()
@property (strong, nonatomic) NSArray *menu;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;

@end

@implementation DeintistkartInfoVC
@synthesize tableView,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,policyarry,left_menu_brand_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    global_page_id=@"CategoriesViewController";
    
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, self.view.frame.size.height);
    leftmenulist_view.frame = CGRectMake(0, 50, ([self screenSize].width/2)+[self screenSize].width/3, [self screenSize].height-50);
    
    [self.view addSubview:leftmenulist_view];
    
    left_menu_profile_img.layer.cornerRadius=10;
    left_menu_profile_img.clipsToBounds=YES;
    
    leftmenulist_view.hidden=YES;
    
    if ([logged_name_str isEqualToString:@""]||[logged_name_str isEqualToString:@"(null)"]||logged_name_str==nil||logged_name_str==NULL) {
        left_menu_profile_name.hidden=YES;
        left_menu_profile_email_lbl.hidden=YES;
        [left_menu_logout_btn setTag:1];
        [left_menu_logout_btn setTitle:@"Login" forState:UIControlStateNormal];
        self.dentistkartname_lbl.adjustsFontSizeToFitWidth=YES;
        self.show_user_not_log_view.frame = CGRectMake(0, 0,([self screenSize].width/2)+[self screenSize].width/3 , self.leftmenu_underview.frame.size.height);
        [self.leftmenulist_view addSubview:self.show_user_not_log_view];
        //self.cartitemscount_btn.hidden=YES;
        
    }else{
        
        //self.cartitemscount_btn.hidden=NO;
       // self.cartitemscount_btn.layer.cornerRadius=8.0f;
        //NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        //[self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];

        [left_menu_logout_btn setTag:2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [leftmenulist_view addGestureRecognizer:tap];
        
    }
    
    self.dentistkartname_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/12];
    
    left_menu_home_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_category_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_brand_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_promotions_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_polices_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_contact_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    left_menu_logout_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    
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
    
    
    
    if (cartcountvalue==0) {
        NSLog(@"cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=YES;
        // [self performSelector:@selector(getCartCountValue) withObject:nil afterDelay:0.1];
    }else{
        NSLog(@" else cartcountvalu check:%d",cartcountvalue);
        self.cartitemscount_btn.hidden=NO;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];
        
    }
    
    self.policies_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";

    
    [self performSelector:@selector(callArray) withObject:nil afterDelay:0.0];
    
    

    //[self callPoliciesService];
}




-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

-(void)callArray{
    temparrstore = [[NSMutableArray alloc]initWithArray:[self tempPolicyData]];
    [tableView reloadData];

}



-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}


- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    [self leftMenuHomeClick:nil];
    /*
    if(tappedButton.tag ==1){
        //drop_down_view.hidden=NO;
        leftmenulist_view.hidden=NO;
        [drop_down_btn_pro setTag:2];
        
    }else if(tappedButton.tag ==2){
        [drop_down_btn_pro setTag:1];
        leftmenulist_view.hidden=YES;
        //drop_down_view.hidden=YES;
    }
     */
}



-(NSArray*)tempPolicyData{
    NSLog(@"enter in tempPolicyData");
    NSMutableArray *collector = [NSMutableArray new];
     temppolicy_arr = [[NSMutableArray alloc]init];
    // NSArray*tempsectionarr = @[@"Shipping Policy",@"Refund Policy",@"Privacy Policy",@"Cancel & Return Policy",@"Terms & Conditions"];
    NSMutableArray*tempsectionarr = [[NSMutableArray alloc]init];
    
    
    NSString*str_url = @"https://dentistkart.com/webservice/policies/";
    
    
    // NSError*error;
   // NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url]];
    
    NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];
    str_url=nil;
    
    NSData*data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    [req release];
    NSString*returnStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"returnStr:%@",returnStr);
    NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    
    if (dict==NULL) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }else{
        
        NSDictionary*creat_result_dict = [dict objectForKey:@"createResult"];
        NSLog(@"create_result_dict:%@",creat_result_dict);
        NSDictionary*policies_dict = [creat_result_dict objectForKey:@"policy"];
        NSLog(@"policies_dict:%@",policies_dict);
        
        
        for (NSDictionary*tempdict in policies_dict) {
            NSLog(@"tempdict:%@",tempdict);
            [tempsectionarr addObject:[tempdict objectForKey:@"policies_title"]];
            [temppolicy_arr addObject:[tempdict objectForKey:@"policies_description"]];
        }
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }
    
    
    
    
    
    
    /*
    NSArray*tempsectionarr = @[@"Shipping Policy",@"Refund Policy",@"Privacy Policy",@"Cancel & Return Policy",@"Terms & Conditions"];
    NSString*str_shippolicy = @"After the announcement of the latest budget, shipping charges of all goods, in general, have touched the sky. In spite of this development, DentistKart is trying to minimize these expenses as much as possible. Free shipping will be done for all orders above INR 2000. For orders below INR 2000, nominal shipping charges will be charged.\n \t The company has tied up with Blue Dart and DTDC for delivery of ordered items. DTDC will deliver products to clients within Telangana and Andhra Pradesh, while Blue Dart will deliver products to the rest of India.\n \t Expected time of delivery of products is as follows-\n \t1. To Telangana and Andhra Pradesh  – within 24 hours \n \t2. To Metros  – within 24 to 48 hours \n \t3. To Rest of India  – 48 to 72 hours \n \t You are requested to note that the delivery time might vary depending upon unforeseen factors. Though we will constantly try to deliver within the above mentioned deadlines, in case of any delay, we request you to bear with us. In case of such occurrence, you will be duly notified about the status of the shipment and you will also be able to track your shipment online.";
    
    
    NSString*str_refundpolicy = @"In case of a refund, the refund amount (after price adjustments for shipping, handling etc.) will be credited to your credit card/bank account. It usually takes about 4-7 working days for the amount to be credited. However, the time may vary depending upon the bank involved, holidays and other factors.";

    
    
    NSString*str_privacypolicy = @"We, at DentistKart, have no intentions whatsoever of collecting your personal information (including name, billing and shipping addresses, date of birth, gender, email id, contact number etc.) for any purpose other than to sell you product(s) available on our website. We collect only that information which we feel is relevant for us to sell and deliver you products in the most efficient way. We may also use the personal information you have given us to update you about the latest products and offers available on our online store.\n \tYour personal information will never be revealed to a third-party under any circumstances. We have a very strict policy about maintaining the privacy of our valued customers. Your credit card / debit card / net banking details will also be safe as we have tied up with our payment gateway to have a multi-level safety wall to protect your information. In case you have any problem in disclosing the information which is required by us to sell you a product, you may refrain from doing so. However, in such a scenario, you will not be able to proceed further to buy products from our website.\n \tIn case any kind of clarification is needed, call or email us immediately.";

    NSString*str_cancelreturnpolicy = @"Our aim is to serve you. From our side, we will always try to provide you with the best items in their best condition. However, if you do happen to find some defect/damage with the delivered product, or if you find out that you have ordered the wrong item by mistake, we will try to replace the item accordingly. In such cases, we request you to follow certain guidelines and give us sufficient time to process the order.\n \tReturn of ordered items are subject certain conditions. Whenever you receive a shipment and for some reason you want to return the shipment (for exchange with same product or for exchange with some other product or for refund of money or for any other reason), kindly do the following:\n\t1. Examine the item carefully and make sure that it is the item that you have purchased.\n\t2. Do not open the seal or the box in which the item has arrived and do not tamper with the item in any way.\n\t3. Do not tamper with any additional components or accessories which come with certain items.\n\t 4. Do not remove or throw away labels and information leaflets which come with the item.\n\t 5. Call or email us immediately with the necessary information.\n\t The item(s) has/have to be returned to us within 10 days after you receive it. No returns will be accepted after 10 days. Damaged items which are damaged due to negligence on your part (for example: dropping the item while opening a package may damage the contents) will not be accepted. Only unopened items in their original packs will be accepted. All returns will be thoroughly scrutinized before approving the refunds.\n\t Cancellations will be valid only if done within 10 days of invoice date. No charges will be levied if the product has not been shipped. However, if the product has already been shipped, you will have to ship the product back to us and the refund will be processed after necessary price adjustments.\n\t In case further clarification is needed, call or email us immediately.";

    
    NSString*str_termsconditionspolicy = @"DentistKart is owned by ‘VMR Dental Suppliers Pvt. Ltd.’. Our motto is to provide relief to dental practitioners, students of Dentistry and dental laboratories across the country in terms of easy availability of daily consumables. For us to be able to provide you the best service, we request you to go through the Terms & Conditions of the company and understand them completely. In case of any disagreement, you may choose not to purchase any items from our website. However, if you are purchasing items from DentistKart, it will be assumed that you have gone through and agreed to all the terms and conditions mentioned.";

    NSLog(@"midel");
    
    */
    /*
    [temppolicy_arr addObject:str_shippolicy];
    [temppolicy_arr addObject:str_refundpolicy];
    [temppolicy_arr addObject:str_privacypolicy];
    [temppolicy_arr addObject:str_cancelreturnpolicy];
    [temppolicy_arr addObject:str_termsconditionspolicy];
    */
    
    
    
    NSArray*arrtemp = @[@"1"];
    for (int i=0; i<temppolicy_arr.count; i++) {
         MenuSection *section = [MenuSection new];
        NSLog(@"loop for:%@",[tempsectionarr objectAtIndex:i]);
        section.title=[tempsectionarr objectAtIndex:i];
        NSLog(@"after title");
        if (i==0) {
            section.isVisible=@YES;
        }
        //section.isVisible=@YES;
       // NSLog(@"after visible:%@ :%d",temppolicy_arr,i);
       
        
        section.items =arrtemp;
        NSLog(@"after items");
        [collector addObject:section];
        
    }
    
    NSLog(@"collector array:%@",collector);
    NSLog(@"exit in tempPolicyData");
    
    return [collector copy];
    //[self setPolicyarry:temppolicy_arr];
    
    //return NULL;
}

-(NSArray *)menu {
    if (_menu == nil) {
        //[self performSelector:@selector(readlogin) withObject:nil afterDelay:0.1];
        
       //_menu = [self tempPolicyData];
        
        _menu = temparrstore;
        
        
    }
    return _menu;
}


#pragma mark - RRNCollapsableTableView

-(NSString *)sectionHeaderNibName {
    NSLog(@"sectionHeaderNibName");
    return @"MenuSectionHeaderView";
}

-(NSArray *)model {
    NSLog(@"model method");
    
    return self.menu;
}

-(UITableView *)collapsableTableView {
    NSLog(@"collapsableTableView");
    return self.tableView;
}

#pragma mark - UITableView
/*
- (void)setUpCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"child_cat_id_arr:%@",child_cat_id_arr);
    if (child_cat_id_arr.count==0) {
        
    }else{
        cell.textLabel.text =[child_name_dict objectForKey:[child_cat_id_arr objectAtIndex:indexval]];
    }
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}
*/
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"headerforsection");
    return [self screenSize].width/12;
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell for roww");
    //id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    //id item = mSection.items[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    
    /** NOTE: This method can return nil so you need to account for that in code */
    
    //UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    PolicyCell *cell = (PolicyCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.hidden=YES;
    // NOTE: Add some code like this to create a new cell if there are none to reuse
    if(cell == nil)
    {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PolicyCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[PolicyCell class]])
            cell = (PolicyCell *)oneObject;
    }
   
    NSString*policy_str = [temppolicy_arr objectAtIndex:indexPath.section];
    
    txtview = [[UITextView alloc]initWithFrame:CGRectMake(0,0, self.tableView.frame.size.width,self.tableView.frame.size.height/2)];
    
    txtview.text = policy_str;
    txtview.font = [UIFont systemFontOfSize:[self screenSize].height/50];
    [cell addSubview:txtview];
    //[cell.textview setFont:[UIFont fontWithName:@"System" size:[self screenSize].width/10]];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell updateConstraintsIfNeeded];
   // if (temppolicy_arr.count==indexval) {
     //   indexval=0;
    //}
  //  cell.frame = CGRectMake(0, 0, [self screenSize].width, [self screenSize].height/2);
    //cell.textview.text=[temppolicy_arr objectAtIndex:indexval];
   // cell.textview.text=[temppolicy_arr objectAtIndex:indexPath.section];
    //cell.textview.font = [UIFont systemFontOfSize:[self screenSize].height/50];
   //cell.textview.font = [UIFont fontWithName:@"System" size:[self screenSize].height/50];
  //  cell.textLabel.text =[temppolicy_arr objectAtIndex:indexval];
    //indexval++;
    cell.hidden=NO;
    
    return cell;
}
/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 }
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Table Name:didselect:%liu",(long)indexPath.row);
    /*
    NSArray*temparr = [catid_child_dict objectForKey:[category_id_arr objectAtIndex:indexPath.section]];
    child_catid_str  = [temparr objectAtIndex:indexPath.row];
    NSLog(@"child_catid_str:%@",child_catid_str);
    CategoryProductsView *cpv = [[CategoryProductsView alloc]initWithNibName:@"CategoryProductsView" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cpv animated:NO];
    */
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath called");
   //return 144.0f;
     return [self screenSize].height/2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"heightForFooterInSection");
    
    return 1.00f;
}



-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}


///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController *pvc = [[[ProductsViewController alloc]init]autorelease];
    [self presentViewController:pvc animated:YES completion:nil];
    [pvc release];
}

- (IBAction)leftMenuCategoryClick:(id)sender {
    
    isBrands=NO;
    [self callCategoriesPage];
    
    /*
    CategoriesViewController*cvc = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cvc animated:NO];
     */
}

- (IBAction)leftMenuBrandsClick:(id)sender {
    isBrands=YES;
    [self callCategoriesPage];
    
    
}

- (IBAction)leftMenuPromotionClick:(id)sender {
    PromotionsVC*promo = [[PromotionsVC alloc]init];
    [self presentViewController:promo animated:YES completion:nil];

}

- (IBAction)leftMenuPolicesClick:(id)sender {
    [self callDentistKartInfo];
}

- (IBAction)leftMenuContactusClick:(id)sender {
    //[self callDentistKartInfo];
    ContactUsVC * cuvc = [[ContactUsVC alloc]init];
    [self presentViewController:cuvc animated:YES completion:nil];
}

-(void)callDentistKartInfo{
    
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]init];
    [self presentViewController:hpi animated:YES completion:nil];
}

-(void)callCategoriesPage{
    
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
}


- (IBAction)leftMenuLogoutClick:(id)sender {
    UIButton*tapped = (UIButton*)sender;
    if (tapped.tag==1) {
        [self login];
    }else if (tapped.tag==2){
        [self logOut];
    }
}

- (IBAction)cartPageClick:(id)sender {
    cartpageopen_str=@"read";
     pageIdentify_str=@"DentistkartInfo";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}

- (IBAction)searchBtnClick:(id)sender {
    pageIdentify_str=@"DentistkartInfo";
    SearchVC*svc = [[[SearchVC alloc]init]autorelease];
    [self presentViewController:svc animated:YES completion:nil];
    [svc release];
}



- (void)didReceiveMemoryWarning {
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
    [_policies_lbl release];
    [super dealloc];
}
@end
