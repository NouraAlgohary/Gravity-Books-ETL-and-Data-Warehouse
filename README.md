# Gravity Books ETL and Data Warehouse Documentation

## Project Overview:
Welcome to the Gravity Books Sales ETL and Data Warehouse Project documentation. This initiative aims to transform the existing Gravity Books Sales database into a robust data warehouse, enabling advanced analytics and reporting capabilities. The project involves the use of Extract, Transform, Load (ETL) processes to migrate and transform data, and the implementation of SQL Server Analysis Services (SSAS) to create a cube for in-depth data analysis.

## Source Database Overview:

### Database Information:
- **Database Type:**
  - Describe the type of database used for the Gravity Books Sales source data (e.g., relational database, transactional database).

- **Technology Stack:**
  - Specify the technologies used in the source database environment.

### Data Structure:
- **Tables and Entities:**
  - List key tables in the source database and briefly describe their purposes.
  - Identify primary entities and relationships within the source data.

- **Schema Design:**
  - Provide insights into the schema design of the source database.
  - Mention any normalization or denormalization practices applied.

### Data Extraction Methods:
- **Extraction Tools:**
  - Describe the tools or methods used for extracting data from the source database.
  - Specify any challenges or considerations related to data extraction.

- **Data Quality:**
  - Discuss data quality in the source database.
  - Note any data cleansing or preprocessing steps performed during extraction.

### Sample Data:
- **Data Examples:**
  - Provide a few examples of typical data records in the source database.
  - Highlight key fields and their meanings.

### Source Database Schema (if applicable):
![image](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/628aaf8b-f334-4011-8da4-c0660697f3ba)

The above image provides an overview of the schema structure in the Gravity Books Sales source database, illustrating tables, relationships, and key entities.

Understanding the source database is crucial for designing effective ETL processes and creating a well-structured data warehouse. The information gathered from the source database informs decisions about data transformations, mappings, and optimizations during the ETL process.


## Data Warehouse Architecture:
![DWH Schema](https://github.com/NouraAlgohary/Gravity-Books-ETL-and-Data-Warehouse/assets/103903785/ed2ce229-0ba8-44c3-b309-cb4fdcb495f3)


## Data Modeling:
- **Entity-Relationship Diagram (ERD):**
  - Visual representation of the data model.
  - Explanation of tables, relationships, and key attributes.

## Schema and Tables:
- **Table Definitions:**
  - Detailed information about each table in the data warehouse.
- **Field Descriptions:**
  - Definitions of each field, including data types, lengths, and constraints.

## Reporting and Analytics:
- **Purpose:**
  - Explanation of how the data warehouse supports reporting and analytics for Gravity Books.
- **Queries and Views:**
  - Sample SQL queries and views commonly used for analysis.

## ETL Architecture:
- **Components:**
  - Overview of the SSIS packages, tasks, and containers used.
  - Mention of any external tools or systems integrated.

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
