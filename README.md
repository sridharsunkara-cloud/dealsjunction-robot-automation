# DealsJunction – Robot Framework Test Automation

Automated UI and API testing for [DealsJunction](https://www.dealsjunction.de/), a live web application, using Robot Framework, Python, SeleniumLibrary, and RequestsLibrary.

## Project Overview

This project demonstrates hands-on QA automation, including:

- **UI Testing:** Homepage validation, navigation, and login-form verification.
- **API Testing:** HTTP status validation, JSON response verification, and negative search scenarios.
- **Reusable Test Design:** Shared keywords and browser configuration.
- **CI/CD Integration:** Automated test execution using GitHub Actions on Ubuntu.
- **Test Reporting:** Robot Framework HTML reports and downloadable GitHub Actions artifacts.

## Test Coverage

| Test Suite | Tests | Coverage |
|---|---:|---|
| API | 3 | HTTP status, search results, negative search |
| Homepage | 2 | Page title, restaurant navigation |
| Login | 4 | Login page, email field, password field, required-field validation |
| **Total** | **9** | **All 9 passed in the latest CI run** |

## Prerequisites

- Python 3.13
- Google Chrome
- Git

## Installation

Clone the repository:

```bash
git clone https://github.com/sridharsunkara-cloud/dealsjunction-robot-automation.git
cd dealsjunction-robot-automation
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate it on Windows PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

Install dependencies:

```bash
pip install -r requirements.txt
```

## Running Tests

Execute the complete test suite:

```bash
python -m robot --outputdir results tests/
```

Execute individual suites:

```bash
python -m robot --outputdir results tests/api.robot
python -m robot --outputdir results tests/homepage.robot
python -m robot --outputdir results tests/login.robot
```

## Test Reports

After execution, Robot Framework generates:

- `results/report.html` — overall test results
- `results/log.html` — detailed execution logs
- `results/output.xml` — machine-readable results

The `results/` directory is excluded from Git using `.gitignore`.

## GitHub Actions CI/CD

The project includes a GitHub Actions workflow that:

1. Checks out the repository.
2. Sets up Python 3.13.
3. Installs the required dependencies.
4. Executes Robot Framework tests on an Ubuntu runner using `xvfb-run`.
5. Uploads test reports as downloadable artifacts.

The workflow runs automatically when changes are pushed to the `main` branch and can also be triggered manually.

## Security

Real passwords and API credentials must not be hardcoded in test files.

GitHub Actions repository secrets are configured for future authenticated test scenarios. The current login tests validate login-form functionality without performing a real user login.