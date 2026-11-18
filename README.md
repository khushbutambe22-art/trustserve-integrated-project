# TrustServe – Integrated Academic Prototype

**Tagline:** Trusted Services. Verified Professionals.

A multi-page responsive website built with HTML, CSS and JavaScript, with a Java 17 backend using OOP concepts. It includes a runnable software-test harness, Docker support, MySQL schema starter, and cloud deployment notes.

## 1. Requirements
- JDK 17 or newer
- VS Code (Extension Pack for Java recommended)
- Optional: Docker Desktop
- Optional: Git + GitHub account

No Node.js or Maven installation is required for the basic version.

## 2. Run in VS Code (Windows)
1. Download and extract `TrustServe_Integrated_Project.zip`.
2. Open VS Code → **File → Open Folder** → select `TrustServe_Integrated_Project`.
3. Confirm Java JDK 17+ is installed. In VS Code Terminal run:
   ```powershell
   java -version
   javac -version
   ```
4. Run the server:
   ```powershell
   .\run.bat
   ```
   If PowerShell blocks the batch file, run:
   ```powershell
   cmd /c run.bat
   ```
5. Open this URL in your browser: **http://localhost:8080**
6. Use the navigation bar to open the different pages.

### Demo account
- Email: `customer@trustserve.demo`
- Password: `Trust123!`

The demo login accepts the demo account or any non-empty email/password. This is for classroom demonstration only, not production authentication.

## 3. Run software tests
Open a second VS Code terminal and run:
```powershell
.\test.bat
```
The test harness compiles and executes Java tests and prints PASS/FAIL results. It tests pricing, service listing, booking creation, validation and review scoring.

## 4. Docker (optional)
Install and start Docker Desktop, then from the project folder:
```powershell
docker compose up --build
```
Open http://localhost:8080. Stop with `Ctrl+C`, then:
```powershell
docker compose down
```
If `docker` is not recognized, Docker Desktop/CLI is not installed or its PATH is not refreshed. Restart the terminal after installing Docker Desktop.

## 5. Pages included
- Home / Landing
- Sign Up
- Login
- Customer Dashboard
- Professional Dashboard
- Services
- AI Fair Price Calculator
- Booking
- Booking Confirmation
- SafeVisit
- Skill Passport
- Society Group Booking
- Reviews

## 6. Java OOP concepts used
- **Encapsulation:** private fields and getters in domain classes.
- **Inheritance:** `User` is the parent class; `Customer` and `Professional` extend it.
- **Polymorphism:** `User.getRoleLabel()` is overridden by subclasses.
- **Abstraction:** service classes (`PricingService`, `BookingService`, `ReviewService`) expose focused operations.
- **Objects:** bookings, users, professionals and reviews are represented as Java objects.

## 7. Project architecture
```text
Browser (HTML/CSS/JavaScript)
        |
        | HTTP requests / JSON
        v
Java HTTP Server (port 8080)
        |
        +-- AuthService
        +-- BookingService
        +-- PricingService
        +-- ReviewService
        +-- ServiceCatalog
        |
        +-- In-memory demo data
        |
        +-- database/schema.sql (MySQL starter schema)
```
The default project stores demo bookings in memory; restarting the Java server clears them. `database/schema.sql` is a starter schema for a future persistent MySQL integration. Do not describe the current demo as a live MySQL-connected application.

## 8. Cloud deployment (Render + GitHub)
1. Create a GitHub repository named `trustserve-integrated-project`.
2. Upload/push the extracted project folder to the repository.
3. Create a Render account and choose **New → Web Service**.
4. Connect the GitHub repository.
5. Choose **Docker** as the runtime. Render will build using the included `Dockerfile`.
6. Deploy. Open the public URL provided by Render.
7. For future production use, add a managed database, environment-based secrets, HTTPS, real OTP provider, secure password hashing, server-side validation and persistent storage.

Alternative: deploy the Docker image to any cloud VM/container service that supports Docker. Never commit real passwords, API keys or personal customer information.

## 9. Important academic prototype limitations
- OTP, Aadhaar verification, SafeVisit identity checks, UPI payment, AI diagnosis and SMS/WhatsApp alerts are simulated UI demonstrations only.
- The price calculator is a rule-based sample estimator, not a real AI model or market quotation.
- Login is a demo flow; passwords are not securely stored.
- Booking data is in memory and is not persistent.
- MySQL schema is supplied as a design starter, not connected by default.

## 10. Suggested report evidence
Capture screenshots of Home, Login, Dashboard, AI Fair Price, Booking Confirmation, SafeVisit, Skill Passport and Society Booking. Run `test.bat` and include its console output as test execution evidence.
