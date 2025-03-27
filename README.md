# **Software Test Automation Project**

## **Overview**
This project demonstrates automated test cases for the [Demoblaze website](https://www.demoblaze.com) using **Robot Framework** with **SeleniumLibrary**. The goal is to automate key user interactions such as **Sign Up**, **Log In**, **Log Out**, and error scenarios like invalid credentials or duplicate user registration.

The project is designed to:
- Automate browser-based interactions.
- Validate website functionality.
- Provide a clean structure for scalability and maintainability.

---

## **Table of Contents**
1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Project Structure](#project-structure)
4. [Test Cases](#test-cases)
5. [Execution](#execution)
6. [Troubleshooting](#troubleshooting)
7. [Contributing](#contributing)
8. [License](#license)

---

## **Prerequisites**
Before running the tests, ensure you have the following installed:
- **Python 3.x**: Download from [python.org](https://www.python.org/downloads/).
- **Chrome Browser**: Ensure Chrome is installed and updated.
- **ChromeDriver**: Download the version matching your Chrome browser from [chromedriver.chromium.org](https://sites.google.com/chromium.org/driver/).
- **PyCharm (Optional)**: Use the free Community Edition for development.
- **Git (Optional)**: For cloning the repository.

---

## **Installation**
Follow these steps to set up the project:

### 1. Clone the Repository
```bash
git clone https://github.com/your-repo/software-test-automation.git
cd software-test-automation
```

### 2. Set Up a Virtual Environment
```bash
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```
The `requirements.txt` file includes:
- `robotframework`
- `robotframework-seleniumlibrary`

### 4. Configure ChromeDriver
Ensure the `chromedriver.exe` is in your system's PATH or specify its location explicitly in the test script.

---

## **Project Structure**
The project follows a clean and modular structure:
```
software-test-automation/
│
├── tests/             # Folder containing test scripts
│   ├── test.robot     # Main test script
│   └── test_case.txt  # Description of test cases
│
├── output/                 # Folder for test execution outputs
│   ├── log.html            # Detailed test logs
│   ├── report.html         # Test execution report
│   └── output.xml          # Raw test results
│
├── README.md               # This file
├── requirements.txt        # Python dependencies
└── chromedriver.exe        # WebDriver for Chrome (if not in PATH)
```

---

## **Test Cases**
Below are the test cases implemented in this project:

### 1. **Sign Up**
- **Description**: Registers a new user on the website.
- **Steps**:
  1. Open the website.
  2. Click the **Sign Up** button.
  3. Enter a username and password.
  4. Confirm successful registration.

### 2. **Sign Up - User Already Exists**
- **Description**: Attempts to register a user that already exists.
- **Expected Result**: Displays an alert: "This user already exists."

### 3. **Log In**
- **Description**: Logs in with valid credentials.
- **Steps**:
  1. Open the website.
  2. Click the **Log In** button.
  3. Enter the username and password.
  4. Confirm successful login by checking the welcome message.

### 4. **Log In - Wrong Password**
- **Description**: Attempts to log in with an incorrect password.
- **Expected Result**: Displays an alert: "Wrong password."

### 5. **Log In - User Does Not Exist**
- **Description**: Attempts to log in with a nonexistent user.
- **Expected Result**: Displays an alert: "User does not exist."

### 6. **Log Out**
- **Description**: Logs out after a successful login.
- **Steps**:
  1. Log in to the website.
  2. Click the **Log Out** button.
  3. Confirm successful logout by checking that the login button reappears.

---

## **Execution**
Run the test cases using the following command:
```bash
robot tests/test.robot
```

### **Outputs**
After execution:
- **Log File**: `output/log.html` (Detailed logs for debugging).
- **Report**: `output/report.html` (Summary of test results).
- **Raw Output**: `output/output.xml`.

---

## **Troubleshooting**
### 1. **ElementNotInteractableException**
- **Cause**: Elements might not be fully loaded or visible when Selenium tries to interact.
- **Solution**:
  - Add explicit waits using `Wait Until Element Is Visible`.
  - Maximize the browser window using `Maximize Browser Window`.

### 2. **WebDriver Version Mismatch**
- **Cause**: ChromeDriver version does not match the installed Chrome browser.
- **Solution**:
  - Download the correct version of ChromeDriver from [chromedriver.chromium.org](https://sites.google.com/chromium.org/driver/).

### 3. **Media Foundation Error**
- **Error**: `Failed to start Media Foundation`.
- **Solution**:
  - This error is non-critical and can be ignored. It pertains to browser media capabilities.

---

## **Contributing**
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m "Add your feature"`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request.

---

## **License**
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## **Additional Resources**
- [Robot Framework Documentation](https://robotframework.org/)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)
- [Demoblaze Website](https://www.demoblaze.com)
