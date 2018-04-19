//
//  SearchVC.m
//  Dentistkart
//
//  Created by Aparna Reddy Challa on 11/01/16.
//  Copyright © 2016 Google Inc. All rights reserved.
//

#import "SearchVC.h"
#import "AppDelegate.h"
#import "CategoriesViewController.h"
#import "LoginViewController.h"

#import "ProductDetails.h"
#import "ProductTblCell.h"
#import "DeintistkartInfoVC.h"
#import "ContactUsVC.h"
#import "PromotionsVC.h"
#import "MyAccountView.h"
#import "MyAddressVC.h"
#import "MyOrdersVC.h"
#import "OrderVC.h"
#import "CategoryProductsView.h"
#import "MyAccountEditVC.h"
@interface SearchVC ()

@end

@implementation SearchVC
@synthesize left_menu_category_btn,left_menu_contact_btn,left_menu_home_btn,left_menu_logout_btn,left_menu_polices_btn,left_menu_profile_email_lbl,left_menu_profile_img,left_menu_profile_name,left_menu_brand_btn,left_menu_promotions_btn,leftmenulist_view,drop_down_btn_pro;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //pageIdentify_str=@"SearchVC";
    ///////////////////////Side Menu///////////////////////
    //leftmenulist_view.frame = CGRectMake(0, 50, 200, 600);
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
       
        
    }else{
        
        left_menu_profile_name.text = logged_username;
        left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_name.font = [UIFont systemFontOfSize:[self screenSize].width/25];
        left_menu_profile_name.adjustsFontSizeToFitWidth=YES;
        
        //left_menu_profile_email_lbl.text = global_email_store;
        left_menu_profile_email_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/23];
        left_menu_profile_email_lbl.adjustsFontSizeToFitWidth=YES;
        [left_menu_logout_btn setTag:2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callMyAccountPage)];
        [self.leftmenu_underview addGestureRecognizer:tap];

    }
    //////////////////////////////////////////////////////////
    
    
    
    
    
    
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
    
    temp_plist_arr = [[NSMutableArray alloc]init];
    
    
    
    
    self.search_tblview.delegate=self;
    self.search_tblview.dataSource=self;
    
    self.searchTxtBox.delegate=self;
    [self.searchTxtBox setReturnKeyType:UIReturnKeyDone];
    [self.searchTxtBox resignFirstResponder];
    self.searchTxtBox.font=[UIFont systemFontOfSize:[self screenSize].width/30];
    self.clear_btn.titleLabel.font = [UIFont systemFontOfSize:[self screenSize].width/35];
    [self loadCacheData];

}
-(CGSize)screenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}


-(void)cacheSearchData:(NSArray*)storetxtflddata{
    
    NSError *error;
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Searchdata.plist"];
    NSLog(@"Login is %@",paths);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"fileManager is %@",fileManager);
    if (![fileManager fileExistsAtPath: path])
    {
        NSLog(@"filemanager is %@",fileManager);
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Searchdata" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: path error:&error];
    }
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSLog(@"data:%@",data);
    
    //here add elements to data file and write data to file
   // int value = 5;
    
    NSLog(@"storetxtflddata componentsJoinedByString:%@",[storetxtflddata componentsJoinedByString:@","]);
    NSString*strvalue = [storetxtflddata componentsJoinedByString:@","];
    NSLog(@"strvalue:%@",strvalue);
    
    [data setObject:[storetxtflddata componentsJoinedByString:@","] forKey:@"value"];
    
    [data writeToFile: path atomically:YES];
    
    
    
    NSMutableDictionary *savedStock = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSLog(@"saved:%@",savedStock);
   
}


-(void)loadCacheData{
    
    
    
    NSError *error;
   // NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
     NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Searchdata.plist"];
    NSLog(@"Login is %@",paths);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSLog(@"fileManager is %@",fileManager);
    if (![fileManager fileExistsAtPath: path])
    {
        NSLog(@"filemanager is %@",fileManager);
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Searchdata" ofType:@"plist"];
        [fileManager copyItemAtPath:bundle toPath: path error:&error];
    }
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSLog(@"data:%@",data);
    
    if ([[data objectForKey:@"value"] isEqual:@""]) {
        NSLog(@"[data objectForKey:]:%@",[data objectForKey:@"value"]);
    }else{
        //temp_plist_arr = [[NSMutableArray alloc] initWithArray:[data objectForKey:@"value"]];
    //    NSMutableString*strvalue = [data objectForKey:@"value"];
        
        NSString* myString = [data objectForKey:@"value"];
        NSArray* myArray = [myString  componentsSeparatedByString:@","];
        
        temp_plist_arr = [[NSMutableArray alloc]initWithArray:myArray];
        
   
   
        NSLog(@"temp chech:%@",temp_plist_arr);
        //[temp_plist_arr addObject:[[data objectForKey:@"value"] componentsJoinedByString:@","]];
    }
    
    //[temp_plist_arr removeObjectAtIndex:0];
    //[temp_plist_arr removeLastObject];
   // NSLog(@"storetxtflddata componentsJoinedByString:%@",[storetxtflddata componentsJoinedByString:@""]);
    NSString*strvalue = [temp_plist_arr componentsJoinedByString:@","];
    NSLog(@"strvalue laod:%@",strvalue);
   // [data setObject:strvalue forKey:@"value"];
    
    //[data writeToFile: path atomically:YES];
   // NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    //NSLog(@"data:%@",data);
    
}


-(void)callMyAccountPage{
    MyAccountView*mmyacct = [[MyAccountView alloc]init];
    [self presentViewController:mmyacct animated:YES completion:nil];
}

-(void)callSearchService:(NSString*)txtfeildData{
//NSString*str_url = @"https://dentistkart.com/dentistkart/webservice/search/productsearch.php?search=";
    
   // MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //hud.labelText = @"Loading....";
    
    NSString*str_url = [NSString stringWithFormat:@"https://dentistkart.com/webservice/search/productsearch.php?search=%@",txtfeildData];
    NSLog(@"search url:%@",str_url);
    NSMutableURLRequest*req = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:str_url]];
    
    NSData*data = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    
    NSDictionary*dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog(@"dict:%@",dict);
    if (dict==nil||dict==NULL) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"No Response From Server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }else{
        
        
        NSString* statuscode = [dict objectForKey:@"statuscode"];
        NSString* message = [dict objectForKey:@"message"];
        
        NSLog(@"statuscode:%@",statuscode);
        
        
        NSLog(@"enter else");
        
        NSLog(@"check1");
        NSLog(@"statuscode check:%@",statuscode);
        int status = [statuscode intValue];
        
        if (status==1||[message isEqualToString:@"Authentication Success."])
            
        {
            
            
            NSLog(@"enter success block");
            NSDictionary*createResult_dict = [dict objectForKey:@"createResult"];
            NSDictionary*searchresult = [createResult_dict objectForKey:@"searchdata"];
            
            product_id_arr = [[NSMutableArray alloc]init];
            product_name_arr  = [[NSMutableArray alloc]init];
            product_short_arr  = [[NSMutableArray alloc]init];
            product_desc_arr  = [[NSMutableArray alloc]init];
            product_image_arr  = [[NSMutableArray alloc]init];
            product_price_arr  = [[NSMutableArray alloc]init];
            tempproduct_id_arr = [[NSMutableArray alloc]init];
            product_available_arr = [[NSMutableArray alloc]init];
            
        
        
        
        for (NSDictionary*localdict in searchresult) {
            
            NSLog(@"dictinory local:%@",localdict);
            
            NSString*product_id_str = [localdict objectForKey:@"product_id"];
            NSLog(@"product id:%@",product_id_str);
            //[product_id_arr addObject:product_id_str];
            [tempproduct_id_arr addObject:product_id_str];
            NSString*product_name_str = [localdict objectForKey:@"name"];
            
            if ([product_name_str isEqualToString:@""]||[product_name_str isEqualToString:@"<null>"]||[product_name_str isEqualToString:@"null"]||[product_name_str isEqualToString:@"(null)"]||product_name_str ==nil||product_name_str==NULL)
            {
                product_name_str=@"Not Available";
            }
            NSLog(@"product name:%@",product_name_str);
            [product_name_arr addObject:product_name_str];
            
            NSString*product_desc_str = [localdict objectForKey:@"description"];
            
            if ([product_desc_str isEqualToString:@""]||[product_desc_str isEqualToString:@"<null>"]||[product_desc_str isEqualToString:@"null"]||[product_desc_str isEqualToString:@"(null)"]||product_desc_str ==nil||product_desc_str==NULL)
            {
                product_desc_str=@"Not Available";
            }
            NSLog(@"product_desc_str:%@",product_desc_str);
            [product_desc_arr addObject:product_desc_str];
            
            
            
            NSString*product_short_str = [localdict objectForKey:@"short_description"];
            
            if ([product_short_str isEqualToString:@""]||[product_short_str isEqualToString:@"<null>"]||[product_short_str isEqualToString:@"null"]||[product_short_str isEqualToString:@"(null)"]||product_short_str ==nil||product_short_str==NULL)
            {
                product_short_str=@"Not Available";
            }
            NSLog(@"product_short_str:%@",product_short_str);
            [product_short_arr addObject:product_short_str];
            
            
            NSString*available_stock_check;
            NSString*avialable_stock_str = [localdict objectForKey:@"visibility"];
            if ([avialable_stock_str isEqualToString:@""]||[avialable_stock_str isEqualToString:@"<null>"]||[avialable_stock_str isEqualToString:@"null"]||[avialable_stock_str isEqualToString:@"(null)"]||avialable_stock_str ==nil||avialable_stock_str==NULL)
            {
                avialable_stock_str=@"Out of Stock";
                available_stock_check=@"";
            }else{
                available_stock_check=@"In Stock";
            }
            
            prodavailability_glb_str = [NSString stringWithFormat:@"%@ %@",avialable_stock_str,available_stock_check];
            
            [product_available_arr addObject:prodavailability_glb_str];
            
            
            NSString*product_price_str = [localdict objectForKey:@"price"];
            
            if ([product_price_str isEqualToString:@""]||[product_price_str isEqualToString:@"<null>"]||[product_price_str isEqualToString:@"null"]||[product_price_str isEqualToString:@"(null)"]||product_price_str ==nil||product_price_str==NULL)
            {
                product_price_str=@"Not Avialable";
            }
            NSLog(@"product_price_str:%@",product_price_str);
            [product_price_arr addObject:product_price_str];
            
            NSString*product_sprice_str = [localdict objectForKey:@"special_price"];
            
            if ([product_sprice_str isEqualToString:@""]||[product_sprice_str isEqualToString:@"<null>"]||[product_sprice_str isEqualToString:@"null"]||[product_sprice_str isEqualToString:@"(null)"]||product_sprice_str ==nil||product_sprice_str==NULL)
            {
                product_sprice_str=@"";
            }
            NSLog(@"product_sprice_str:%@",product_sprice_str);
            [product_special_price_arr addObject:product_sprice_str];
            
            
            
            NSString*url = [localdict objectForKey:@"image_url"];
            
            if ([url isEqualToString:@""]||[url isEqualToString:@"<null>"]||[url isEqualToString:@"null"]||[url isEqualToString:@"(null)"]||url ==nil||url==NULL)
            {
                url=@"Not Avialable";
            }
            [product_image_arr addObject:url];
            
            
        }
            
            //[self cacheSearchData:temp_plist_arr];
            [self.search_tblview reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }else if (status==2||[message isEqualToString:@"Error in Authentication."]){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Internet is not avialable" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }else if(status==0){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"%@ is not found",self.searchTxtBox.text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];

        }
        
    
    }
    
}
- (IBAction)drop_down_click_user:(id)sender{
    UIButton*tappedButton =  (UIButton*)sender;
    NSLog(@"drop_down_click_user:%ld",(long)tappedButton.tag);
    //[self leftMenuHomeClick:nil];
    
    
    if ([pageIdentify_str isEqualToString:@"ProductsViewController"]) {
        [self leftMenuHomeClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"CategoriesViewController"]){
        [self callCategoriesPage];
    }else if ([pageIdentify_str isEqualToString:@"MyAddressVC"]){
        MyAddressVC *mavc = [[MyAddressVC alloc]init];
        [self presentViewController:mavc animated:YES completion:nil];

    }else if ([pageIdentify_str isEqualToString:@"MyOrdersVC"]){
        MyOrdersVC *movc = [[MyOrdersVC alloc]init];
        [self presentViewController:movc animated:YES completion:nil];

    }else if ([pageIdentify_str isEqualToString:@"CategoryProductsView"]){
        CategoryProductsView *cpv = [[CategoryProductsView alloc]init];
        [self presentViewController:cpv animated:YES completion:nil];
    }else if ([pageIdentify_str isEqualToString:@"ProductDetails"]){
        ProductDetails *pdv = [[ProductDetails alloc]init];
        [self presentViewController:pdv animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"MyAccountEditVC"]){
        MyAccountEditVC *mavc = [[MyAccountEditVC alloc]init];
        [self presentViewController:mavc animated:YES completion:nil];
        
    }else if ([pageIdentify_str isEqualToString:@"MyAccountView"]){
        [self callMyAccountPage];
    }else if ([pageIdentify_str isEqualToString:@"DeintistkartInfoVC"]){
        [self callDentistKartInfo];
    }else if ([pageIdentify_str isEqualToString:@"ContactUsVC"]){
        [self leftMenuContactusClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"PromotionsVC"]){
        [self leftMenuPromotionClick:nil];
    }else if ([pageIdentify_str isEqualToString:@"SearchVC"]){
        SearchVC *svc = [[SearchVC alloc]init];
        [self presentViewController:svc animated:YES completion:nil];
    }else if ([pageIdentify_str isEqualToString:@"OrderVC"]){
        OrderVC *ovc = [[OrderVC alloc]init];
        [self presentViewController:ovc animated:YES completion:nil];
    }
    
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

#pragma UITextFeild Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self textFieldDidEndEditing:textField];
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing bool");
    return YES;

}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField;
{
    NSLog(@"textFieldDidEndEditing");
    [textField resignFirstResponder];
    NSLog(@"textFieldDidEndEditing");
    if (textField.text.length>0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Loading....";
        
        [temp_plist_arr addObject:textField.text];
        [self cacheSearchData:temp_plist_arr];
        
        for (int i=0; i<temp_plist_arr.count; i++) {
            [temp_plist_arr removeObjectAtIndex:i];
        }
       [temp_plist_arr removeAllObjects];
        NSLog(@"temp_plist_arr:%@",temp_plist_arr);
       
        
        
        NSLog(@"");
        [self callSearchService:textField.text];
        //[temp_plist_arr addObject:textField.text];
        //[self.search_tblview reloadData];
    }else{
        NSLog(@"empty txtfeild");
    }

    //nameString = [[NSString alloc]initWithFormat:@"%@",text1.text];
    
}


- (BOOL)textFieldShouldClear:(UITextField *)textField{

    return YES;
}
///////////////////////////////TableView delegate methods///////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"count username:%ld",(long)tempproduct_id_arr.count);
    
   /*
    if (10 + (10 * reloads_)==[tempproduct_id_arr count]) {
        countRow = 10 + (10 * reloads_);
        NSLog(@"countRow in numberOfRowsInSection:%d",countRow);
        return [tempproduct_id_arr count];
    }else if ([tempproduct_id_arr count]<10 + (10 * reloads_)){
        return [tempproduct_id_arr count];
    }else if ([tempproduct_id_arr count]>10 + (10 * reloads_)){
        countRow = 10 + (10 * reloads_);
        return [tempproduct_id_arr count];
    }
    //return 5 + (5 * reloads_);
    */
    
    if (temp_plist_arr.count>0) {
        return [temp_plist_arr count];
    }else{
    return [tempproduct_id_arr count];
    }
    //return nil;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellforrow");
    
    
    
    NSLog(@"temp_plist_arr:%@",temp_plist_arr);
    if (temp_plist_arr.count>0) {
        
        NSLog(@"temp_plist_arr count:%lu",(unsigned long)temp_plist_arr.count);
        static NSString *simpleTableIdentifier = @"SimpleTableItem";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
        
        cell.textLabel.text = [[NSString alloc]initWithFormat:@"%@",[temp_plist_arr objectAtIndex:indexPath.row]];
         cell.textLabel.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        return cell;
        
        
        
        
    }else{
    
    ProductTblCell * pcell;
    
    static NSString *cellIdentifier1 = @"cellIdentifier1";
    pcell = (ProductTblCell *)[self.search_tblview dequeueReusableCellWithIdentifier:cellIdentifier1];
    
    if (pcell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTblCell"
                                                     owner:self options:nil];
        for (id oneObject in nib) if ([oneObject isKindOfClass:[ProductTblCell class]])
            pcell = (ProductTblCell *)oneObject;
    }
    pcell.selectionStyle = UITableViewCellSelectionStyleNone;
    //////////////////////////////mani editing/////////////////////////////////////////////////////////
    
    NSLog(@"product_image_arr:%@",product_image_arr);
    NSString *product_img_str=[[NSString alloc]initWithFormat:@"%@",[product_image_arr objectAtIndex:[indexPath row]]];
    
    
    
    NSLog(@"Product Image Check:%@",product_img_str);
    // pcell.user_name.text =product_img_str;
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:product_img_str]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        pcell.product_img.image = [UIImage imageWithData:data];
    }];
    
    NSString *name_str=[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
    pcell.product_name.text = name_str;
    pcell.product_name.font = [UIFont systemFontOfSize:[self screenSize].width/45];
    
    
    NSString *price_str=[[NSString alloc]initWithFormat:@"Rs.%.2f",[[product_price_arr objectAtIndex:[indexPath row]] doubleValue]];
    NSString*sppricestr = [[NSString alloc]initWithFormat:@"(Rs.%.2f)",[[product_special_price_arr objectAtIndex:indexPath.row] doubleValue]];
    
    if ([sppricestr isEqualToString:@"(Rs.0.00)"]) {
        
        NSLog(@"enter in if Rs.0.00");
        pcell.product_price.text = price_str;
        pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];
        pcell.specialprice_lbl.text=@"";
        
        }else{
    
            NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:price_str];
            
            
            // making text property to strike text- NSStrikethroughStyleAttributeName
            [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
            
            
            pcell.product_price.text = sppricestr;
            pcell.product_price.font = [UIFont systemFontOfSize:[self screenSize].width/40];

            
            [pcell.specialprice_lbl setAttributedText:titleString];
            
            pcell.specialprice_lbl.font = [UIFont systemFontOfSize:[self screenSize].width/40];

    }
    
    pcell.addcart_btn.tag = indexPath.row;
    
    NSString*product_desc_str = [[NSString alloc]initWithFormat:@"%@",[product_desc_arr objectAtIndex:[indexPath row]]];
    pcell.productdesc_txtview.editable=NO;
    [pcell.productdesc_txtview setValue:product_desc_str forKey:@"contentToHTMLString"];
    
    pcell.productdesc_txtview.font = [UIFont systemFontOfSize:[self screenSize].width/50];
    
    
    
    // pcell.stock_data.text = prodavailability_glb_str;
    
   pcell.stock_data.text = [product_available_arr objectAtIndex:indexPath.row];
    pcell.stock_data.font = [UIFont systemFontOfSize:[self screenSize].width/50];
    
    //////////////////////////////////mani end editing//////////////////////////////
    
    //pcell.productdesc_txtview.text = product_desc_str;
    
    //    pcell.qtytxtfeild.text
    
    
    // NSLog(@"text Value:%@",pcell.qtytxtfeild.text);
    
    
   
    ////////////////////////////////mani changed////////////////////////////
    
/*
    UIButton *repeateBtn = [[UIButton alloc]initWithFrame:CGRectMake(pcell.product_price.frame.origin.x,pcell.product_price.frame.origin.y+pcell.product_price.frame.size.height+2, pcell.cellsecondview.frame.size.width, 30)];
    
    
    [repeateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    repeateBtn.titleLabel.font = [UIFont fontWithName:@"Santor" size:[self screenSize].width/30];
    //repeateBtn.titleLabel.text = @"Add Cart";
    [repeateBtn setTitle:@"Add to cart" forState:UIControlStateNormal];
    
    
    /////////////////////////////////////////end editing///////////////////////
    //[repeateBtn setBackgroundColor:[UIColor blueColor]];
    //repeateBtn.titleLabel.text = @"Add to Cart";
    //repeateBtn.titleLabel.textColor=[[UIColor alloc]initWithWhite:1.0f alpha:1.0f];
    // [repeateBtn setTitle:@"Add Cart" forState:UIControlStateNormal];
    // [repeateBtn setImage:[UIImage imageNamed:@"CartButtonBlue"] forState:UIControlStateNormal];
    //repeateBtn.titleLabel.textColor = [UIColor whiteColor];
    
    ////////////mani edit change//////////////////////
    
    
    if ([[product_available_arr objectAtIndex:indexPath.row] isEqual:@" Out of Stock"]) {
        repeateBtn.enabled=NO;
        [repeateBtn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:0.3]];
        
    }else{
        
        repeateBtn.enabled=YES;
        [repeateBtn setBackgroundColor:[UIColor colorWithRed:79/255.0 green:194/255.0 blue:234/255.0 alpha:1.0]];
    }
    
    
    repeateBtn.tag = [[tempproduct_id_arr objectAtIndex:indexPath.row] integerValue];
    repeateBtn.layer.borderWidth=1.0;
    repeateBtn.layer.cornerRadius=2.0;
    repeateBtn.layer.borderColor = [UIColor clearColor].CGColor;
    [repeateBtn addTarget:self action:@selector(addToCartPage:) forControlEvents:UIControlEventTouchUpInside];
    [pcell.cellsecondview addSubview:repeateBtn];
    */
        
        pcell.addtocart_btn.hidden=YES;
    
    /////////////////////////////////////////////end//////////////////////
    // countRow++;
    
    // countRow = countRow + 1;
    return pcell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"didselect");
    
    if (temp_plist_arr.count>0) {
        self.searchTxtBox.text = [temp_plist_arr objectAtIndex:indexPath.row];
        
        [self textFieldDidEndEditing:self.searchTxtBox];
        //[self callSearchService:self.searchTxtBox.text];
        NSLog(@"searchtxtbox:%@",self.searchTxtBox.text);
    }else{
    prodimages_glb_arr=nil;
    
    // prodid_global_str = [[NSString alloc]initWithFormat:@"%@",[product_id_arr objectAtIndex:[indexPath row]]];
        pageIdentify_str=@"SearchVC";
    
    global_product_id = [[product_id_arr objectAtIndex:[indexPath row]] intValue];
    NSLog(@"product_id_arr:%@",product_id_arr);
    NSLog(@"global_product:%d",global_product_id);
    }
    
    /*
     prodname_glb_str =[[NSString alloc]initWithFormat:@"%@",[product_name_arr objectAtIndex:[indexPath row]]];
     
     prodprice_glb_str = [[NSString alloc]initWithFormat:@"$%@",[product_price_arr objectAtIndex:[indexPath row]]];
     
     
     prodimages_glb_arr = [[NSMutableArray alloc]init];
     
     [prodimages_glb_arr addObject:[product_image_arr objectAtIndex:indexPath.row]];
     
     prodavailability_glb_str=@"Avialble in stock";
     
     prodshort_glb_str = [[NSString alloc]initWithFormat:@"%@",[product_short_arr objectAtIndex:indexPath.row]];
     
     prodlongdesc_glb_str = [[NSString alloc]initWithFormat:@"%@",[product_desc_arr objectAtIndex:[indexPath row]]];
     */
    
    //[self loadProductDetailsView];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (temp_plist_arr.count>0) {
    return [self screenSize].width/10;
    }else{
        return 205;
    }
}

-(void)loadProductDetailsView{
    ProductDetails *pd = [[ProductDetails alloc]init];
    [self presentViewController:pd animated:YES completion:nil];
}


///////////////////////////////////////////////end of table delegate methods//////////////////////////////////////

-(void)logOut{
    NSLog(@"Logout form cart");
    ProductsViewController *pcvout = [[ProductsViewController alloc]init];
    [pcvout logOut];
}

-(void)login{
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [self presentViewController:lvc animated:YES completion:nil];
}
///////////////////////////////////////////////////////////////////////
- (IBAction)leftMenuHomeClick:(id)sender {
    ProductsViewController *pvc = [[ProductsViewController alloc]init];
    [self presentViewController:pvc animated:YES completion:nil];
}

- (IBAction)leftMenuCategoryClick:(id)sender {
    /*
    CategoriesViewController*cvc = [[CategoriesViewController alloc]initWithNibName:@"CategoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:cvc animated:NO];
     */
    
    isBrands=NO;
    [self callCategoriesPage];

}

- (IBAction)leftMenuBrandsClick:(id)sender {
    isBrands=YES;
    [self callCategoriesPage];

}

-(void)callCategoriesPage{
    CategoriesViewController*cvclocal = [[CategoriesViewController alloc]init];
    [self presentViewController:cvclocal animated:YES completion:nil];
    
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
   // [self callDentistKartInfo];
}

- (IBAction)leftMenuLogoutClick:(id)sender {
    
    UIButton*tapped = (UIButton*)sender;
    if (tapped.tag==1) {
        [self login];
    }else if (tapped.tag==2){
        [self logOut];
    }
}

-(void)callDentistKartInfo{
    DeintistkartInfoVC *hpi = [[DeintistkartInfoVC alloc]init];
    [self presentViewController:hpi animated:YES completion:nil];
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
    [_searchTxtBox release];
    [_search_tblview release];
    [_clear_btn release];
    [super dealloc];
}
- (IBAction)clearBtnClick:(id)sender {
    
    if (self.searchTxtBox.text.length>0) {
        
    
    self.searchTxtBox.text=@"";
    product_id_arr = nil;
    product_name_arr  = nil;
    product_short_arr  = nil;
    product_desc_arr  = nil;
    product_image_arr  = nil;
    product_price_arr  = nil;
    tempproduct_id_arr = nil;
    product_available_arr = nil;
    [self.search_tblview reloadData];
        [self loadCacheData];
        [self.search_tblview reloadData];
    }else{
    
    }
    //[self loadCacheData];
    
    
    
    //[self textFieldShouldClear:self.searchTxtBox];
}
@end
