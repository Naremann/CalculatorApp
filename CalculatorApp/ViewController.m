//
//  ViewController.m
//  CalculatorApp
//
//  Created by Nareman on 26/03/2024.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *result_text;

- (IBAction)numBtns:(id)sender;
- (IBAction)operationsBtns:(id)sender;
- (IBAction)equal_btn:(id)sender;
- (IBAction)clear_btn:(id)sender;
@property (nonatomic, strong) NSMutableString *currentNumber;
@property (nonatomic, assign) double result;
@property (nonatomic, assign) char operation;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentNumber = [NSMutableString stringWithString:@""];
        self.result = 0;
    
}

- (IBAction)numBtns:(id)sender {
    UIButton *btn=(UIButton *)sender;
    NSInteger number = btn.tag;
    
    [self.currentNumber appendString:[NSString stringWithFormat:@"%ld", (long)number]];
    self.result_text.text = self.currentNumber;
    

    
}


- (IBAction)operationsBtns:(id)sender {
    UIButton *btn=(UIButton *)sender;
    switch (btn.tag) {
            case 11:
                [self performOperation:'+'];
                break;
            case 12:
                [self performOperation:'-'];
                break;
            case 13:
                [self performOperation:'*'];
                break;
            case 14:
                [self performOperation:'/'];
                break;
            default:
                break;
        }
}
- (IBAction)equal_btn:(id)sender {
    [self performOperation:self.operation];
}

- (IBAction)clear_btn:(id)sender {
    [self.currentNumber setString:@""];
    self.result = 0.0;
    [self updateResult];
}

- (void)performOperation:(char)op {
    double number = [self.currentNumber doubleValue];
    switch (self.operation) {
        case '+':
            self.result += number;
            break;
        case '-':
            self.result -= number;
            break;
        case '*':
            self.result *= number;
            break;
        case '/':
            if (number != 0) {
                self.result /= number;
            } else {
                
                self.result = NAN;
            }
            break;
        default:
            self.result = number;
            break;
    }
    self.operation = op;
    [self.currentNumber setString:@""];
    [self updateResult];
}

- (void)updateResult {
    self.result_text.text = [NSString stringWithFormat:@"%.2f", self.result];
}




@end
