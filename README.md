# Books Database Setup 

This repository contains scripts to set up a **PostgreSQL** database for managing books, including titles, subtitles, authors, and publishers.

## Features
-  **Stores books information** (title, subtitle, author, publisher)
-  **Admin and View-Only Users**
-  **Stored Function:** Fetch books by a specific author
-  **View for Books with Publishers**
-  **Structured SQL Scripts for Easy Execution**
-  **Automated Setup with a Bash Script**

## Prerequisites 
- **PostgreSQL** installed and running
- **Git Bash (Windows) / Terminal (Mac/Linux)**
- **Bash Shell** to execute scripts

## Setup Instructions 

### **1️ Clone the Repository**
```bash
git clone https://github.com/umeshchippa/books-database.git
cd books-database
```

### **2️ Make the Setup Script Executable**
```bash
chmod +x setup_books_db.sh
```

### **3️ Run the Setup Script**
```bash
./setup_books_db.sh
```

This will execute all SQL scripts in order.

---

## **Database Users**
- **Admin User:** `umesh_chippa` (Full privileges)
- **View-Only User:** `view_user` (Read-only access)

## **SQL Features**
### **Stored Function: `get_books_by_author(author_name)`**
Retrieves books by a given author.
```sql
SELECT * FROM get_books_by_author('George Orwell');
```

### **View: `books_with_publishers`**
Provides an overview of all books and publishers.
```sql
SELECT * FROM books_with_publishers;
```

---

### **Folder Structure**
```
books-database/
│── setup_books_db.sh            # Bash script to automate setup
│── sql/                          # SQL scripts
│   ├── 01_create_database.sql   # Creates database & drops old one
│   ├── 02_create_tables.sql     # Defines the books table
│   ├── 03_insert_sample_data.sql # Inserts sample books
│   ├── 04_create_users.sql      # Creates admin & view-only users
│   ├── 05_create_functions.sql  # Function to get books by author
│   ├── 06_create_views.sql      # Creates a view for books with publishers
│   ├── 07_grant_permissions.sql # Grants appropriate permissions
│── ExecutionResults/            # Images of Executions
│   ├── script_output.png        # output of the script execution
│   ├── database_output.png      # database , tables etc
│── README.md                    # Documentation
```

### **Contact**
 **Email:** umesh.chippa1405@gmail.com  
 **GitHub:** [umeshchippa](https://github.com/ChippaUmesh)