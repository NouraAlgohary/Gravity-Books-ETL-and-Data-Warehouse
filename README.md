# Gravity Books ETL and Data Warehouse Documentation

## Project Overview:
Welcome to the Gravity Books Sales ETL and Data Warehouse Project documentation. This initiative aims to transform the existing Gravity Books Sales database into a robust data warehouse, enabling advanced analytics and reporting capabilities. The project involves the use of Extract, Transform, Load (ETL) processes to migrate and transform data, and the implementation of SQL Server Analysis Services (SSAS) to create a cube for in-depth data analysis.

## Source Database Overview:

### Database Information:
- **Database Type:**
  - Relational Database (Microsoft SQL Server).

- **Technology Stack:**
  - Microsoft SQL Server (2019)
  - SQL Server Management Studio (SSMS) for database management.

### Data Structure:

#### Tables and Entities:

1. **`author` Table:**
   - Purpose: Stores information about book authors.
   - Fields:
     - `author_id`: Unique identifier for the author.
     - `author_name`: Name of the author.
   - Constraints:
     - Primary Key: `author_id`

2. **`publisher` Table:**
   - Purpose: Stores information about book publishers.
   - Fields:
     - `publisher_id`: Unique identifier for the publisher.
     - `publisher_name`: Name of the publisher.
   - Constraints:
     - Primary Key: `publisher_id`

3. **`book_language` Table:**
   - Purpose: Stores information about book languages.
   - Fields:
     - `language_id`: Unique identifier for the language.
     - `language_code`: Code representing the language.
     - `language_name`: Name of the language.
   - Constraints:
     - Primary Key: `language_id`

4. **`book` Table:**
   - Purpose: Stores information about books.
   - Fields:
     - `book_id`: Unique identifier for the book.
     - `title`: Title of the book.
     - `isbn13`: ISBN-13 code of the book.
     - `language_id`: Foreign key referencing `book_language` table.
     - `num_pages`: Number of pages in the book.
     - `publication_date`: Date when the book was published.
     - `publisher_id`: Foreign key referencing `publisher` table.
   - Constraints:
     - Primary Key: `book_id`
     - Foreign Keys: `language_id`, `publisher_id`

5. **`book_author` Table:**
   - Purpose: Represents the many-to-many relationship between books and authors.
   - Fields:
     - `book_id`: Foreign key referencing `book` table.
     - `author_id`: Foreign key referencing `author` table.
   - Constraints:
     - Primary Key: Composite key (`book_id`, `author_id`)
     - Foreign Keys: `book_id`, `author_id`

#### Primary Entities and Relationships:

- The data structure in the `gravity_books` database comprises key tables, each representing a specific entity such as authors, publishers, book languages, books, and their relationships.

- **Author-Book Relationship:**
  - The `book_author` table establishes a many-to-many relationship between books and authors.

- **Book-Publisher Relationship:**
  - The `book` table includes a foreign key (`publisher_id`) referencing the `publisher` table, establishing a relationship between books and publishers.

### Data Extraction Methods:
- **Extraction Tools:**
  - SQL Server Integration Services (SSIS) for data extraction.

### Sample Data:
![image](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/57d30b0c-972d-4f53-9903-b86441d81f17)

### Source Database Schema:
![image](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/628aaf8b-f334-4011-8da4-c0660697f3ba)

The above image provides an overview of the schema structure in the Gravity Books Sales source database, illustrating tables, relationships, and key entities.

Understanding the source database is crucial for designing effective ETL processes and creating a well-structured data warehouse. The information gathered from the source database informs decisions about data transformations, mappings, and optimizations during the ETL process.


## Data Warehouse
### Data Modeling:
- **Entity-Relationship Diagram (ERD):**
![DWH Schema](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/ed2ce229-0ba8-44c3-b309-cb4fdcb495f3)


### Schema and Tables:
#### Tables Overview:

##### DimOrder Table:
1. **Location:** Top left corner of the image.
2. **Fields:**
   - `method_id_SK` (Primary Key)
   - `method_id_bk` (Business Key)
   - `method_name`
   - `source_system_code`
   - `start_date`
   - `end_date`
   - `is_current`

##### FactOrder Table:
1. **Location:** Center of the image.
2. **Fields:**
   - `order_id_SK` (Primary Key)
   - `line_id` (Business Key)
   - `order_history_id` (Foreign Key)
   - `book_id` (Foreign Key)
   - `customer_id` (Foreign Key)
   - `shipping_method_id` (Foreign Key)
   - `order_status_id` (Business Key)
   - `order_status`
   - `price`
   - `shipping_cost`
   - `source_system_code`
   - `created_at`

##### DimBook Table:
1. **Location:** Top right corner.
2. **Fields:**
   - `book_id_SK` (Primary Key)
   - `book_id_BK` (Business Key)
   - `language_id_BK` (Business Key)
   - `author_id_BK` (Business Key)
   - `publisher_id_BK` (Business Key)
   - `isbn13`
   - `publication_date`
   - `num_pages`
   - `language_name`
   - `publisher_name`
   - `author_name`
   - `source_system_code`
   - `start_date`
   - `end_date`
   - `is_current`

##### DimCustomer Table:
1. **Location:** Bottom left corner.
2. **Fields:**
   - `customer_id_SK` (Primary Key)
   - `customer_id_BK` (Business Key)
   - `address_id_BK` (Business Key)
   - `country_id_BK` (Business Key)
   - `status_id_BK` (Business Key)
   - `first_name`
   - `last_name`
   - `email`
   - `country_name`
   - `street_name`
   - `city`
   - `address_status`
   - `source_system_code`
   - `start_date`
   - `end_date`
   - `is_current`

##### DimDate Table:
1. **Location:** Bottom right corner.
2. **Fields:**
   - `date_Id_SK` (Primary Key)
   - `year`
   - `month`
   - `day`
   - `start_date`
   - `end_date`
   - `is_current`

#### Schema Architecture:

- Each table is connected to the **FactOrder** table via foreign keys, forming a **star schema**.
- The **FactOrder** table is positioned at the center, surrounded by dimension tables (**DimOrder, DimBook, DimCustomer, DimDate**).
- This star schema architecture facilitates efficient querying and data analysis, a common practice in Data Warehousing.

## Reporting and Analytics:

### Purpose:

The primary objective of the Gravity Books Data Warehouse is to provide robust support for reporting and analytics. This section outlines how the data warehouse facilitates data analysis, decision-making, and reporting for Gravity Books.

### Explanation:

The Data Warehouse is designed to centralize and organize data from various sources, making it conducive for in-depth reporting and analytics. By integrating information into a structured and optimized format, users can perform complex queries and derive valuable insights. The reporting and analytics capabilities are crucial for:

1. **Business Intelligence:** Enabling stakeholders to make informed decisions by gaining a comprehensive view of Gravity Books' operations and performance.
2. **Trend Analysis:** Identifying patterns and trends in sales, customer behavior, and inventory, helping Gravity Books respond strategically to market dynamics.
3. **Operational Efficiency:** Monitoring and analyzing key performance indicators to optimize day-to-day operations and streamline business processes.
4. **Strategic Planning:** Supporting long-term strategic planning by providing historical and current data trends for informed decision-making.

## ETL Architecture:

### Components:

The Extract, Transform, Load (ETL) process is a critical component of the Gravity Books Data Warehouse, responsible for transferring and transforming raw data into a structured format suitable for analysis. The ETL architecture consists of several key components:

#### 1. DimBook_ETL:

- **Overview:** This ETL package focuses on the extraction, transformation, and loading of data related to books into the data warehouse. It ensures that the DimBook dimension table is updated with the latest information, including details about book titles, authors, languages, and publishers.

- **SSIS Tasks and Containers:** DimBook_ETL utilizes various SSIS tasks and containers to extract data from source systems, perform necessary transformations, and load the information into the DimBook dimension table.

#### 2. DimCustomer_ETL:

- **Overview:** This ETL package is designed to handle the extraction, transformation, and loading of customer-related data. It updates the DimCustomer dimension table with up-to-date information about Gravity Books' customers, including names, addresses, and contact details.

- **SSIS Tasks and Containers:** DimCustomer_ETL employs a set of SSIS tasks and containers to extract customer data, apply required transformations, and populate the DimCustomer dimension table.

#### 3. DimShippingMethod_ETL:

- **Overview:** Focusing on shipping methods, this ETL package ensures that the DimShippingMethod dimension table reflects the latest details. It involves extracting data related to shipping methods, applying transformations, and loading the information into the data warehouse.

- **SSIS Tasks and Containers:** DimShippingMethod_ETL employs SSIS tasks and containers to manage the ETL process, from extraction to loading, ensuring data accuracy in the DimShippingMethod dimension table.

#### 4. FactOrder_ETL:

- **Overview:** The FactOrder_ETL package is crucial for handling the ETL process related to Gravity Books' orders. It extracts, transforms, and loads data into the FactOrder fact table, capturing essential details about customer orders, order lines, and order history.

- **SSIS Tasks and Containers:** FactOrder_ETL utilizes SSIS tasks and containers to orchestrate the ETL workflow, ensuring that the FactOrder fact table is populated with accurate and timely information.

### Mention of any External Tools or Systems Integrated:

The ETL architecture primarily relies on SQL Server Integration Services (SSIS) for its execution. SSIS provides a robust set of tools for designing, deploying, and managing ETL processes. Additionally, any external tools or systems integrated into the ETL workflow will be documented here, ensuring a comprehensive understanding of the entire ETL architecture.


## Data Flow:
- **Source Systems:**
  - Documentation on source systems, including types of data, data formats, and extraction methods.
- **Destination Systems:**
  - Documentation on the Gravity Books data warehouse, including data models, schema, and loading mechanisms.
- **Data Transformation:**
  - Detailed explanation of data transformations applied.
  - Examples of data mapping and business rules.

## SSIS Packages:
- **Package Descriptions:**
  - Summary of each SSIS package, including its purpose and main functionalities.
- **Execution Order:**
  - Sequence and dependencies among packages.

## Error Handling:
- **Error Codes and Messages:**
  - List of error codes and corresponding error messages.
  - Actions to be taken in case of errors.
- **Logging:**
  - Description of logging mechanisms and how to interpret log files.

## Scheduling and Automation:
- **Job Schedules:**
  - Details on job schedules, frequency, and dependencies.
  - Instructions for manual execution if needed.

## Security:
- **Authentication:**
  - Explanation of how SSIS packages authenticate with source and destination systems.
- **Permissions:**
  - Documentation on required permissions for package execution.

## Maintenance and Troubleshooting:
- **Change Log:**
  - Record of changes made to the ETL process and data warehouse structure.
- **Troubleshooting Guide:**
  - Common issues and their resolutions.
  - Contact information for support.

## Best Practices:
- **Coding Standards:**
  - Guidelines followed for SSIS development.
- **Performance Optimization:**
  - Tips for optimizing both the ETL process and data warehouse performance.

## Version Control:
- **Version History:**
  - Record of SSIS package versions, changes to the data warehouse structure, and overall project updates.

## Training Documentation:
- **User Manuals:**
  - Guides for end-users or support teams.
- **Developer Documentation:**
  - Detailed guides for developers on SSIS development.

## Conclusion:
- **Summary:**
  - Recap of the key points in the documentation.
  - Acknowledgments and references.
