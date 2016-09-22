#import "ViewController.h"
@import LocalAuthentication;

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic) IBOutlet UITextField *textField;
@property (nonatomic) IBOutlet UIView *keyboardShadowView;
@property (nonatomic) IBOutlet NSLayoutConstraint *keyboardShadowViewHeight;
@property (nonatomic) IBOutlet UISlider *delaySlider;
@property (nonatomic) IBOutlet UITextField *sliderValueField;
@property (nonatomic) IBOutlet UIToolbar *inputAccessory;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sliderValueField.inputAccessoryView = self.inputAccessory;
    self.delaySlider.value = [self.sliderValueField.text floatValue];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        self.keyboardShadowViewHeight.constant = CGRectGetHeight(keyboardFrame);
        self.keyboardShadowView.hidden = NO;
        [self.view layoutIfNeeded];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        self.keyboardShadowView.hidden = YES;
        self.keyboardShadowViewHeight.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)didPressStart:(id)sender {
    [self touchID];
}

- (void)touchID {
    NSError *error;
    LAContext *context = [[LAContext alloc] init];
    
    BOOL canEvalute = [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    
    if (canEvalute) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:[NSString stringWithFormat:@"Press Cancel to demonstrate.\n%.2f second delay", self.delaySlider.value]
                          reply:^(BOOL success, NSError * _Nullable error) {
                              [self showKeyboard];
                          }];
    }
    else {
        if (error) {
            NSLog(@"canEvaluatePolicy error: %@", error);
        }
    }
}

- (void)showKeyboard {
    
    if (self.delaySlider.value <= 0.0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.textField becomeFirstResponder];
        });
    }
    else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.delaySlider.value * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.textField becomeFirstResponder];
        });
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)sliderValueChanged:(UISlider *)slider {
    self.sliderValueField.text = [NSString stringWithFormat:@"%.2f", slider.value];
}

- (IBAction)inputValueChanged:(UITextField *)textField {
    self.delaySlider.value = [textField.text floatValue];
}

- (IBAction)didTapDone:(id)sender {
    [self.view endEditing:YES];
}

- (BOOL)resignFirstResponder {
    return [self.view endEditing:YES];
}

- (UIView *)inputAccessoryView {
    return self.inputAccessory;
}

@end
