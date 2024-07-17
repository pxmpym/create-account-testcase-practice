# Create Account Test Case Practice
This repository is my practice project where I have designed a sample "Create Account" page, written test cases, and automated them using the Robot Framework.

### Manual Test Case
[Click here](https://docs.google.com/spreadsheets/d/1gQSQpPJm4zu4Y0pcB2t7igOMHVVQy1Dd7TswPHnsFPA/edit?usp=sharing) to view the manual test cases.

## 1. Create Account Page Details
![create account page](/img/create-account-page.png "create account page")

## 2. Requirements
- Fields: Username, First Name, Last Name, Password, and Confirm Password
- Button: Create Account
### Behavior
1. When the "Create Account" button is clicked after all fields are filled correctly, a toast message "สร้างบัญชีสำเร็จ" (Account creation successful) appears. If not all fields are filled, an error message "กรุณากรอก..." will be displayed, and the account cannot be created.
2. Validation Rules:
- Username:
    - Maximum 20 characters.
    - If more than 20 characters, the message "ชื่อผู้ใช้ไม่ควรเกิน 20 ตัวอักษร" will be displayed, and the account cannot be created.
- Password:
    - Minimum 8 characters.
    - If less than 8 characters, the message "รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร" will be displayed, and the account cannot be created.
- Password Match:
    - The "Password" and "Confirm Password" fields must match.
    - If mismatched, the message "รหัสผ่านไม่ตรงกัน" will be displayed, and the account cannot be created.

## 3. Command to Run Automated Test Case
```bash
robot -d results tests/create-account.robot
```

## 4. Result
![Result](/img/result.png "result")


***If my practice is incorrect or inaccurate in any way, I apologize for it here.✧ ˖🧺˚ ༘ ꊞ 🧸  ₊˚ ***
