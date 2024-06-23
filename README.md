# Freshwater Biosecurity Guide

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage Guide](#usage-guide)
    - [User Registration and Login](#user-registration-and-login)
    - [Navigating the Dashboard](#navigating-the-dashboard)
- [Development](#development)
    - [Contributing](#contributing)
    - [Environment Setup](#environment-setup)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Project Overview
The Freshwater Biosecurity Guide web application is developed as a comprehensive platform aimed at preserving New Zealand's freshwater ecosystems by informing and educating the public about potential biosecurity threats posed by pests and diseases. This project leverages Flask, a Python web framework, to offer a responsive, user-friendly interface that caters to different user roles, each with specific functionalities and permissions.

## Features
- **Dynamic User Roles**: Three distinct user roles (River Users, Staff, Administrators) with role-based access to functionalities.
- **Secure User Authentication**: Incorporates Flask-Bcrypt for hashing passwords, ensuring secure user registration and login processes.
- **CRUD Operations**: Allows for the creation, reading, updating, and deletion of guide entries, providing comprehensive management of biosecurity information.
- **Responsive Web Design**: Crafted using Bootstrap, the application offers a seamless experience across various devices and screen sizes.

## Technologies Used
- **Frontend**: HTML5, CSS3 (Bootstrap 4), JavaScript (with jQuery)
- **Backend**: Flask (Python 3.8+)
- **Database**: MySQL (MariaDB or MySQL 5.7+ recommended)
- **Security**: Flask-Bcrypt for password hashing and Flask-Login for session management

## Getting Started

### Prerequisites
Before beginning, ensure  have the following installed:
- Python 3.8 or newer
- pip and virtualenv
- MySQL server (MariaDB or MySQL 5.7+)

### Installation
Follow these steps to get my development environment set up:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/ZihangFu/Biosecurity.git
    cd Biosecurity
    ```

2. **Create and activate a virtual environment**:
    ```bash
    python3 -m venv venv
    source .venv/scripts/activate.ps1`
    ```

3. **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Database setup**: Create a MySQL database and import the provided schema and initial data.

5. **Environment configuration**: Set up my `.env` file with the required database credentials and secret key.

6. **Run the Flask application**:
    ```bash
    flask run
    ```
    Visit `http://127.0.0.1:5000/` in my browser to access the application.

## Usage Guide

### User Registration and Login
New users can register through the application's registration page. Once registered, users can log in to access their respective dashboards based on their user role.

#### Samples Login Username and Password
- **Admin**:
  - Username: admin
  - Password: Lincoln001!

- **Staff**:
  - Username: staff1
  - Password: Lincoln001!
  - Username: staff2
  - Password: Lincoln001!
  - Username: staff3
  - Password: Lincoln001!

- **Users**:
  - Username: riveruser1
  - Password: Lincoln001!
  - Username: riveruser2
  - Password: Lincoln001!
  - Username: riveruser3
  - Password: Lincoln001!
  - Username: riveruser4
  - Password: Lincoln001!
  - Username: riveruser5
  - Password: Lincoln001!

### Navigating the Dashboard
Each user role has access to different functionalities within the dashboard:
- **River Users**: Can view and edit their profile and browse the biosecurity guide.
- **Staff**: In addition to River User capabilities, can manage guide entries.
- **Administrators**: Have full access to the system, including user and staff management.

## Development

### Contributing
Contributions to this project are welcome. To contribute:
1. Fork the repository.
2. Create a new branch for my feature (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

### Environment Setup
For detailed instructions on setting up my development environment, refer to the Installation section.

## Acknowledgments
This project was made possible by the valuable information and resources provided by:
- Ministry for Primary Industries (MPI) - for biosecurity threat data.
- Department of Conservation (DOC) - for their extensive database on freshwater pests.
- National Institute of Water and Atmospheric Research (NIWA) - for their research on freshwater ecosystems.
