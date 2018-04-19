//
//  CategoriesViewController.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 14/10/15.
//  Copyright © 2015 Google Inc. All rights reserved.
//

#import "CategoriesViewController.h"
#import "MBProgressHUD.h"

//#import "QuartzCore/QuartzCore.h"
#import "FakeModelBuilder.h"
#import "MenuSectionHeaderView.h"
#import "AppDelegate.h"
#import "CategoryProductsView.h"
#import "ProductsViewController.h"
#import "LoginViewController.h"

#import "MyAccountView.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "SearchVC.h"
@interface CategoriesViewController (){
    NSMutableDictionary*tempeachchild_id_dict;
}
@property (strong, nonatomic) NSArray *menu;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end

@implementation CategoriesViewController
@synthesize tableView,left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro,left_menu_brand_btn;

- (void)viewDidLoad {
    
    global_clicked_more=@"";
    //[self getCategoryList];
    // child_name_arr = [[NSMutableArray alloc]init];
    global_page_id=@"CategoriesViewController";
    pageIdentify_str=@"ProductsViewController";
    NSLog(@"view did load called");
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
       // self.cartitemscount_btn.hidden=YES;

    }else{
        
        //self.cartitemscount_btn.hidden=NO;
        //self.cartitemscount_btn.layer.cornerRadius=8.0f;
        NSString*cartcountstr = [[NSString alloc]initWithFormat:@"%d",cartcountvalue];
        [self.cartitemscount_btn setTitle:cartcountstr  forState:UIControlStateNormal];

        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];

        [left_menu_logout_btn setTag:2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [leftmenulist_view addGestureRecognizer:tap];

    }
    
    
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
    
    self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    
    if (isBrands==YES) {
        self.category_lbl.text=@"Brands";
    }
    
    
    
    
    
   // self.cartitemscount_btn.layer.cornerRadius=8.0f;
    
    self.category_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/20];
    
    
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

    
    //left_menu_profile_name.text = logged_username;
    //left_menu_profile_email_lbl.text = global_email_store;
    //////////////////////////////////////////////////////////
    
    //tableView.delegate=YES;
    //tableView.dataSource=YES;
    
    
    child_name_dict = [[NSMutableDictionary alloc]init];
    catid_child_dict =[[NSMutableDictionary alloc]init];
    child_cat_id_arr = [[NSMutableArray alloc]init];
    tempeachchild_id_dict = [[NSMutableDictionary alloc]init];
    [super viewDidLoad];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading....";
    
    [self performSelector:@selector(callArry) withObject:nil afterDelay:0.0];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)callArry{
    NSLog(@"callArry:");
    temparrstore = [[NSMutableArray alloc]initWithArray:[self getCategoryList]];
    [tableView reloadData];
}

-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
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


-(NSArray *)menu {
    if (_menu == nil) {
          //[self performSelector:@selector(readlogin) withObject:nil afterDelay:0.1];
        NSLog(@"menu check one");
      // _menu = [self getCategoryList];
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"headerforsection");
    if ([self screenSize].width<500) {
  return [self screenSize].width/8;
    }else{
        return [self screenSize].width/12;
    }
  
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell for roww");
    //id <RRNCollapsableSectionItemProtocol> mSection = self.menu[indexPath.section];
    //id item = mSection.items[indexPath.row];
    
   static NSString *CellIdentifier = @"Cell";
    
    /** NOTE: This method can return nil so you need to account for that in code */
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // NOTE: Add some code like this to create a new cell if there are none to reuse
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    [cell updateConstraintsIfNeeded];
    if (child_cat_id_arr.count==indexval) {
        indexval=0;
    }
    NSLog(@"child_cat_id_arr arrylist:%@",child_cat_id_arr);
    NSLog(@"indexsection:%d",(int)indexPath.section);
    NSLog(@"indexPath.row:%d",(int)indexPath.row);
    
    NSString*indexsec = [NSString stringWithFormat:@"%d",(int)indexPath.section];
    NSLog(@"[tempeachchild_id_dict objectForKey:indexPath.section]:%@",[tempeachchild_id_dict objectForKey:indexsec]);
    NSArray*tempchildarr = [tempeachchild_id_dict objectForKey:indexsec];
    NSLog(@"tempchildarr:%@",tempchildarr);
    cell.textLabel.text = [tempchildarr objectAtIndex:indexPath.row];
    
    //cell.textLabel.text =[child_name_dict objectForKey:[child_cat_id_arr objectAtIndex:indexval]];
   // cell.textLabel.text =[child_name_dict objectForKey:[child_cat_id_arr objectAtIndex:indexPath.row]];
    //indexval++;
    
        return cell;
}
/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    pageIdentify_str = @"CategoriesViewController";
    NSLog(@"Table Name:didselect:%liu",(long)indexPath.row);
    
    NSArray*temparr = [catid_child_dict objectForKey:[category_id_arr objectAtIndex:indexPath.section]];
    child_catid_str  = [temparr objectAtIndex:indexPath.row];
    NSLog(@"child_catid_str:%@",child_catid_str);
    CategoryProductsView *cpv = [[CategoryProductsView alloc]init];
   [self presentViewController:cpv animated:YES completion:nil];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath called");
    return [self screenSize].width/12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"heightForFooterInSection");
    
    return 1.00f;
}



-(NSArray*)getCategoryList{
    
    @try {
        
   
    NSString *str_getlistCategoryService;
    
    str_getlistCategoryService = [NSString stringWithFormat:@"https://www.dentistkart.com/webservice/product/iOS/?type=category"];
    
    NSLog(@"str_getlistCategoryService:%@",str_getlistCategoryService);
    
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_getlistCategoryService]];
    
   // NSMutableURLRequest*request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_getlistCategoryService] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:60.0];

    
    NSData *returnData = [ NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil ];
    NSString *returnString = [[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"returnString:*%@*",returnString);
    
    NSError *jsonError;
    // NSData *objectData = [returnString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:returnData
                                                         options:kNilOptions
                                                           error:&jsonError];
    NSLog(@"dict:%@",dict);
    
    if (dict==nil||dict==NULL){
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else {
        NSDictionary*creat_result_dict;
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        NSLog(@"enter else");
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        
        int status = [statuscode intValue];
        
        if (status==1&&[message isEqualToString:@"Authentication Success."]){
            NSLog(@"enter success block");
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            category_id_arr = [[NSMutableArray alloc]init];
            parent_id_arr = [[NSMutableArray alloc]init];
            category_name_arr = [[NSMutableArray alloc]init];
            category_child_dict = [[NSMutableDictionary alloc]init];
            
            NSMutableArray *collector = [NSMutableArray new];
           //int countRow=0;
            NSArray*arry_list = [dict objectForKey:@"createResult"];
            
            
            for (int i=0; i<arry_list.count; i++) {
                
                
                MenuSection *section = [MenuSection new];
                creat_result_dict = [arry_list objectAtIndex:i];
                
                NSString  *categry_string=[creat_result_dict objectForKey:@"category_id"];
                NSLog(@"categry_string mani:%@",categry_string);
                
                if (isBrands==YES&&[categry_string isEqualToString:@"43"]) {
                    
                    //self.category_lbl.text=@"Brands";
                    
                    [category_id_arr addObject:categry_string];
                    
                    
                    NSString  *parent_id_str=[creat_result_dict objectForKey:@"parent_id"];
                    NSLog(@"parent_id_str:%@",parent_id_str);
                    [parent_id_arr addObject:parent_id_str];
                    
                    NSString  *category_name_str=[creat_result_dict objectForKey:@"name"];
                    NSLog(@"category_name_str:%@",category_name_str);
                    [category_name_arr addObject:category_name_str];
                    
                    
                    NSString  *child_str=[creat_result_dict objectForKey:@"children"];
                    NSLog(@"child_str mani:%@",child_str);
                    [category_child_dict setObject:child_str forKey:categry_string];
                    /*
                     UIButton *btnTempCate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                     //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
                     btnTempCate.frame = CGRectMake(10,100+(8*countRow),40, 30);
                     [btnTempCate setBackgroundImage:[CategoriesViewController imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];
                     btnTempCate.titleLabel.font = [UIFont fontWithName:@"Santor" size:8.0f];
                     [btnTempCate setTitle:category_name_str forState:UIControlStateNormal];
                     btnTempCate.tag = [categry_string intValue];
                     [btnTempCate addTarget:self action:@selector(selectClicked:) forControlEvents:UIControlEventTouchUpInside];
                     [self.view addSubview:btnTempCate];
                     countRow=countRow+1;
                     */
                    
                    section.title =category_name_str;
                    if (i==0) {
                        NSLog(@"i value visable:%d",i);
                        section.isVisible=@YES;
                    }
                    NSMutableArray *name_arr = [[NSMutableArray alloc]init];
                    
                    NSArray*arry1 = [category_child_dict objectForKey:categry_string];
                    NSMutableArray *chidid_arr = [[NSMutableArray alloc]init];
                    
                    
                    for (int i=0; i<arry1.count; i++) {
                        NSDictionary*subcatdict = [arry1 objectAtIndex:i];
                        //  [name_arr addObject:[subcatdict objectForKey:@"name"]];
                        
                        if ([[subcatdict objectForKey:@"is_active"] intValue]!=0) {
                            
                        
                        NSMutableArray *catid_arr = [subcatdict objectForKey:@"category_id"];
                        [child_cat_id_arr addObject:catid_arr];
                        [chidid_arr addObject:catid_arr];
                        // UILabel*tempLabel = [[UILabel alloc]init];
                        //tempLabel.text = [subcatdict objectForKey:@"name"];
                        NSLog(@"Name:");
                        [name_arr addObject:[subcatdict objectForKey:@"name"]];
                        [child_name_dict setObject:[subcatdict objectForKey:@"name"] forKey:[subcatdict objectForKey:@"category_id"]];
                        }
                        
                        //[child_name_arr addObject:[subcatdict objectForKey:@"name"]];
                    }
                    NSLog(@"name_arr edit:%@",name_arr);
                    NSLog(@"i value:%d",i);
                    NSString*indxvalu = [[NSString alloc]initWithFormat:@"%d",(i)];
                    [tempeachchild_id_dict setObject:name_arr forKey:indxvalu];
                    NSLog(@"tempeachchild_id_dict:%@",tempeachchild_id_dict);
                    
                    
                    [catid_child_dict setObject:chidid_arr forKey:categry_string];
                    NSLog(@"name_arr:%@",name_arr);
                    section.items =name_arr;
                    
                    
                    
                    [collector addObject:section];

                    
                    
                    
                    
                    
                }else if (isBrands==NO&&![categry_string isEqualToString:@"43"]){
                    
                 self.category_lbl.text=@"Categories";
                    NSLog(@"cat:");
                
               
                    
                
                [category_id_arr addObject:categry_string];
                
                
                NSString  *parent_id_str=[creat_result_dict objectForKey:@"parent_id"];
                NSLog(@"parent_id_str:%@",parent_id_str);
                [parent_id_arr addObject:parent_id_str];
                
                NSString  *category_name_str=[creat_result_dict objectForKey:@"name"];
                NSLog(@"category_name_str:%@",category_name_str);
                [category_name_arr addObject:category_name_str];
                
             
                NSString  *child_str=[creat_result_dict objectForKey:@"children"];
                NSLog(@"child_str mani:%@",child_str);
                [category_child_dict setObject:child_str forKey:categry_string];
                /*
                UIButton *btnTempCate = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                //[btnTempDelete addTarget:self action:@selector(sampleDelete:) forControlEvents:UIControlEventTouchUpInside];
                btnTempCate.frame = CGRectMake(10,100+(8*countRow),40, 30);
                [btnTempCate setBackgroundImage:[CategoriesViewController imageWithColor:[UIColor blueColor]] forState:UIControlStateHighlighted];
                btnTempCate.titleLabel.font = [UIFont fontWithName:@"Santor" size:8.0f];
                [btnTempCate setTitle:category_name_str forState:UIControlStateNormal];
                btnTempCate.tag = [categry_string intValue];
                [btnTempCate addTarget:self action:@selector(selectClicked:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:btnTempCate];
                countRow=countRow+1;
                */
                
                section.title =category_name_str;
                    NSLog(@"i value in cat:%d",i);
                    if (i==1) {
                        NSLog(@"i value visable:%d",i);
                        section.isVisible=@YES;
                    }
                //section.isVisible=@YES;
                NSMutableArray *name_arr = [[NSMutableArray alloc]init];
               
                NSArray*arry1 = [category_child_dict objectForKey:categry_string];
                NSMutableArray *chidid_arr = [[NSMutableArray alloc]init];

                
                for (int i=0; i<arry1.count; i++) {
                    
                    NSDictionary*subcatdict = [arry1 objectAtIndex:i];
                  //  [name_arr addObject:[subcatdict objectForKey:@"name"]];
                    if ([[subcatdict objectForKey:@"is_active"] intValue]!=0) {
                    NSMutableArray *catid_arr = [subcatdict objectForKey:@"category_id"];
                    [child_cat_id_arr addObject:catid_arr];
                    [chidid_arr addObject:catid_arr];
                   // UILabel*tempLabel = [[UILabel alloc]init];
                    //tempLabel.text = [subcatdict objectForKey:@"name"];
                    NSLog(@"Name:");
                    [name_arr addObject:[subcatdict objectForKey:@"name"]];
                     [child_name_dict setObject:[subcatdict objectForKey:@"name"] forKey:[subcatdict objectForKey:@"category_id"]];
                    }
                    //[child_name_arr addObject:[subcatdict objectForKey:@"name"]];
                }
                [catid_child_dict setObject:chidid_arr forKey:categry_string];
                section.items =name_arr;
                    NSLog(@"name_arr edit:%@",name_arr);
                    NSLog(@"i value:%d",i);

                    NSString*indxvalu = [[NSString alloc]initWithFormat:@"%d",(i-1)];
                    [tempeachchild_id_dict setObject:name_arr forKey:indxvalu];
                    NSLog(@"tempeachchild_id_dict:%@",tempeachchild_id_dict);
                    
                 NSLog(@"name_arr:%@",name_arr);
                [collector addObject:section];
                
            }
            }
            //[tableView reloadData];
            return [collector copy];
            
        }else if (status==2&&[message isEqualToString:@"Error in Authentication."]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    }
    return NULL;
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception categoroy childs:%@",exception);
    }
    @finally {
        NSLog(@"finalyy");
    }
}


- (IBAction)selectClicked:(id)sender {
    
    
    UIButton*tappedButton = (UIButton*)sender;
    
    NSString*cat_id = [[NSString alloc]initWithFormat:@"%ld",(long)tappedButton.tag];
    
    NSArray*arry1 = [category_child_dict objectForKey:cat_id];
    NSMutableArray *name_arr = [[NSMutableArray alloc]init];
    NSMutableArray *catid_arr = [[NSMutableArray alloc]init];
    for (int i=0; i<arry1.count; i++) {
        NSDictionary*subcatdict = [arry1 objectAtIndex:i];
        [name_arr addObject:[subcatdict objectForKey:@"name"]];
        [catid_arr addObject:[subcatdict objectForKey:@"category_id"]];
    }
 
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
    pageIdentify_str=@"CategoriesViewController";
    addcartcheckint=2;
    [self openCartPage];
}

-(void)openCartPage{
    
    CartVC *cvclocal = [[[CartVC alloc]init]autorelease];
    [self presentViewController:cvclocal animated:YES completion:nil];
    [cvclocal release];
    
}
- (IBAction)searchBtnClick:(id)sender {
     pageIdentify_str=@"CategoriesViewController";
    SearchVC*svc = [[SearchVC alloc]init];
    [self presentViewController:svc animated:YES completion:nil];
}


- (void)dealloc {
    [_leftmenu_underview release];
    [_show_user_not_log_view release];
    [_dentistkartname_lbl release];
    [_category_lbl release];
    [super dealloc];
}
@end
