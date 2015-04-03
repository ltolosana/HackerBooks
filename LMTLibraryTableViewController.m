//
//  LMTLibraryTableViewController.m
//  HackerBooks
//
//  Created by Luis M Tolosana Simon on 3/4/15.
//  Copyright (c) 2015 Luis M Tolosana Simon. All rights reserved.
//

#import "LMTLibraryTableViewController.h"
#import "LMTLibrary.h"
#import "LMTBookViewController.h"
#import "LMTBook.h"

@interface LMTLibraryTableViewController ()

@end

@implementation LMTLibraryTableViewController

#pragma mark - Init
-(id) initWithModel:(LMTLibrary *) model style:(UITableViewStyle) style{
    
    if (self = [super initWithStyle:style]) {
        
        _model = model;
        self.title = @"HackerBooks";
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [self.model.tags count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.model bookCountForTag:[self.model.tags objectAtIndex:section]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Know about the book
    LMTBook *book = nil;
    
    book = [self.model bookForTag:[self.model.tags objectAtIndex:indexPath.section]
                          atIndex:indexPath.row];
    
    
    // Create the cell
    static NSString *cellId = @"BookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        // La tenemos que crear nosotros desde cero
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // Configurarla
    // Es decir, sincronizar modelo (personaje --> vista (celda)
//    cell.imageView.image = book.;
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [book.authors componentsJoinedByString:@","];
    
    // Devolverla
    return cell;
}



-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        //Favorites Books
        return @"Favoritos";
    }else{
        return [self.model.tags objectAtIndex:section];
    }
    
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMTBook *book = nil;
    book = [self.model bookForTag:[self.model.tags objectAtIndex:indexPath.section]
                          atIndex:indexPath.row];
    
    // Avisar al delegado (siempre y cuando entienda el mensaje)
    if ([self.delegate respondsToSelector:@selector(libraryTableViewController:didSelectbook:)]) {
        
        // Te lo mando
        [self.delegate libraryTableViewController:self
                                    didSelectbook:book];
         
    }
}
    

#pragma mark - LMTLibraryTableViewControllerDelegate
-(void) libraryTableViewController:(LMTLibraryTableViewController *)libraryVC didSelectbook:(LMTBook *)book{
    
    // Creamos un CharacterVC
    LMTBookViewController *bookVC = [[LMTBookViewController alloc] initWithModel:book];
    
    // Hago un push
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}

    
    
    
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end