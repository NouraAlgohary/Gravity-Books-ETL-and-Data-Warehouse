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

### Source Systems:

#### Documentation on source systems, including:

1. **Sales Data:**
   - Includes information about book sales, encompassing details such as the book title, quantity sold, price, date of sale, and any associated discounts.
   - 
2. **Data Formats:**
   - database formats

3. **Extraction Methods:**
   - Data extraction from source systems is facilitated through SQL Server Integration Services (SSIS), a robust ETL tool provided by Microsoft. SSIS supports various extraction methods to acquire data from different sources. The primary extraction methods used in the Gravity Books data flow include:

     1. **SSIS Data Flow Tasks:**
        - Utilizing SSIS Data Flow Tasks, data is efficiently extracted from source systems. These tasks are configured to connect to different source types, including databases, flat files, and other external sources.

     2. **Direct Database Connections:**
        - SSIS supports direct connections to various databases, allowing for the extraction of data directly from the source databases. This is particularly useful for real-time or near-real-time data retrieval.

     3. **File Imports:**
        - For sources providing data in file formats such as CSV, Excel, or XML, SSIS File Connection Managers are employed to import data into the ETL process.

     4. **Custom Scripts:**
        - In cases where specific extraction logic is required, custom scripts within SSIS packages can be used to tailor the extraction process to unique source system requirements.

### Destination Systems:

#### Documentation on the Gravity Books Data Warehouse:

1. **Data Models:**
   - The Gravity Books data warehouse is structured around a comprehensive set of data models that facilitate effective analysis and reporting. These models include:

      - **Dimension Tables:**
         - Dimension tables capture descriptive attributes and provide context to the business data. Examples include tables for authors, publishers, customers, and dates.

      - **Fact Tables:**
         - Fact tables store the quantitative and measurable metrics of the business. The central fact table, often the "FactOrder" table, contains key performance indicators related to orders and sales.

      - **Star Schema:**
         - The data models follow a star schema architecture, where the central fact table is connected to multiple dimension tables. This design enhances query performance and simplifies the retrieval of meaningful insights.

      - **Relationships and Keys:**
         - Relationships between tables are established using primary and foreign keys. This ensures data integrity and allows for the creation of meaningful relationships between different aspects of the business.

2. **Schema:**
   - The schema design of the Gravity Books data warehouse reflects a meticulous approach to organizing and storing data. Key elements of the schema include:

      - **Table Structures:**
         - Each table within the data warehouse has a defined structure, outlining the fields and their data types. This clarity aids in understanding the nature of stored information.

      - **Relationships:**
         - The schema illustrates the relationships between tables, showcasing how dimension tables are linked to the central fact table. This relational structure is crucial for conducting complex analyses.

      - **Design Considerations:**
         - The schema incorporates considerations for data normalization, ensuring efficient storage and minimizing redundancy. Additionally, it accommodates denormalization where needed for specific reporting requirements.

3. **Loading Mechanisms:**
   - Loading data into the Gravity Books data warehouse is facilitated through a combination of robust mechanisms, including:

      - **SQL Server Integration Services (SSIS) Packages:**
         - SSIS packages are employed to automate the extraction, transformation, and loading (ETL) processes. These packages streamline the movement of data from source systems to the data warehouse.

### Data Transformation:

#### Detailed explanation of data transformations applied, including:

1. **Transformations Overview:**
   - **Join Transformations:**
     - *Purpose:* Combine data from multiple tables based on specified relationships.
     - *Examples:*
       - Joining the "book" table with the "author" and "publisher" tables to create a comprehensive book dataset.
   - **Derivation Transformations:**
     - *Purpose:* Create derived fields or calculated measures based on existing data.
     - *Examples:*
       - Calculating the total cost of an order by combining product prices.
       - Deriving the age of customers based on their birthdate.
   - **Dimensional Modeling Transformations:**
     - *Purpose:* Transform data into a dimensional model for efficient reporting and analytics.
     - *Examples:*
       - Structuring data into a star schema model.
       - Creating dimension and fact tables for a comprehensive data warehouse structure.

2. **Data Mapping:**
   - Offer detailed mappings between source and destination fields. This ensures a clear understanding of how data from source systems is transformed and mapped to the data warehouse.
   - [here](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/blob/main/Source%20to%20Destination%20Mapping.xlsx) 

3. **Business Rules:**
    1. **Accumulation Logic:**
       - Define the logic for accumulating values over time. Specify whether the accumulation is based on daily, monthly, or another time granularity. For example, if tracking sales, the accumulation logic might sum daily sales values to represent the cumulative sales for each month.
    
    2. **Handling Null or Missing Values:**
       - Specify how null or missing values are treated during the accumulation process. Determine whether missing values should be ignored, treated as zero, or handled in a specific manner to maintain the accuracy of the accumulated data.
    
    3. **Handling Changes in Dimensional Data:**
       - Address how dimensional changes, such as updates to customer information or product details, are handled in the accumulated fact table. Define rules for managing changes in dimension keys to maintain the historical accuracy of the accumulated data.
    
    4. **Effective Dating:**
       - Implement effective dating to track changes over time. Define how the accumulated fact table captures the effective date ranges for each record, ensuring a clear understanding of when specific values were accumulated.

### Examples of Data Mapping and Business Rules:
By supporting Excel for data mapping, the Gravity Books data warehouse promotes transparency, collaboration, and efficiency in managing the mapping process. 

![image](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/79957e97-5a52-4406-9b2a-2b075428cbbe)

## SSIS Packages:
- **Package Descriptions and Execution Order:**
  - Sequence and dependencies among packages.
  1. DimBook 
![DimBook_ETL](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/6ce245de-ed42-4115-b637-a3ad95dddce3)

  2. DimCustomer 
![DimCustomer_ETL](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/d8ecf1e8-91d2-4993-9b90-d1c2b1432fba)

  3. DimShippingMethod
![DimShippingMethod](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/e003f272-2340-4d58-be65-2e57088c71de)

  4. FactOrder 
![FactOrder_ControlFlow](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/36815088-09bd-46fc-985b-bfb1541cf844)

![FactOrder_DataFlow](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/430289c5-f6d9-44d4-927b-2ec3ea0325a8)


## Scheduling and Automation:
- **Job Schedules:**
  **Full Data Load:**
   - **Schedule:** Weekly
   - **Day:** Sunday
   - **Time:** 12:00 AM
   - **Frequency:** Runs weekly to perform a full load of all data from source systems.
 
     ![Job_DimShippingMethod](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/a96ac0e1-6995-4090-ae2a-06d0aefcc930)

      ![Job_DimBook](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/fcd7c8d4-f71c-4a97-9282-ab02032b1dd2)


     ![Job_DimCustomer](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/b27b458f-48d7-4d8c-916c-263fbc426d76)

## Conclusion:

### Summary:

Embarking on the Gravity Books Data Warehouse project has been a transformative experience, serving as a best practice for delving into the realm of ETL (Extract, Transform, Load) processes. This project encompassed the application of new concepts, including the implementation of an accumulated fact table, a pivotal element in enhancing the data warehousing architecture.

The journey unfolded systematically, commencing with the design phase where the data warehouse structure took shape. Utilizing MS SQL Server for schema design and SSIS for ETL processes, the project seamlessly transitioned from conception to execution. The creation of the accumulated fact table, the adoption of dimensional modeling, and the meticulous application of business rules and data mappings contributed to a robust and efficient data warehouse.

### Acknowledgments and References:

I would like to express my gratitude to Eng. **Abdelwahed**, Eng. **Mohamed Mohsen**, and my colleague **[Abdallh Ayman](https://github.com/Abdallh-Ayman)** for their invaluable guidance and support throughout the project. Their insights and expertise played a pivotal role in navigating the complexities of ETL development and data warehousing.

References:
- [How to create job in SQL Server](https://www.youtube.com/watch?v=JcsSZSDlmso&t=956s)

This project has not only expanded my skill set but has also laid a strong foundation for future endeavors in ETL and data warehousing. As I conclude this documentation, I look forward to applying these newfound skills in upcoming projects and further honing my expertise in the dynamic field of data engineering.

