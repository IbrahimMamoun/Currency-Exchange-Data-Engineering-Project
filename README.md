# Currency-Exchange-Data-Engineering-Project


## Project Overview
This project analyzes historical currency exchange rates using Python, SQL Server, and Power BI. It transforms exchange rate data retrieved from the Frankfurter API into structured data for analysis and visualization.

## Purpose
The goal of this project is to demonstrate an end-to-end data pipeline, relational database design, SQL analytics, and business intelligence reporting.

## Technologies Used
- Python
- Pandas
- REST API (Frankfurter)
- SQL Server
- Power BI
- Jupyter Notebook

## Data Pipeline
1. **Extract:** Retrieve historical exchange rate data from the Frankfurter API in JSON format.
2. **Transform:** Use Python and Pandas to reshape and prepare the data for database storage.
3. **Load:** Load the processed data into SQL Server.
4. **Analyze:** Use SQL queries to calculate exchange rate metrics and trends.
5. **Visualize:** Build a Power BI dashboard to present key metrics and exchange rate trends.

## Database Structure
- **DimCurrency:** Stores currency information (dimension table).
- **DimDate:** Stores date attributes (dimension table).
- **FactExchangeRate:** Stores exchange rates by date, base currency, and target currency (fact table).

## Key Analysis
- Latest exchange rate
- Average exchange rate
- Maximum and minimum exchange rates
- Monthly average exchange rates
- Exchange rate changes using the SQL `LAG()` function

## Project Structure
- `Dataset/` — Project dataset files.
- `ETL Architecture/` — ETL pipeline architecture documentation.
- `Python/` — Python ETL script and Jupyter Notebook.
- `SQL/` — Database creation scripts and analytical queries.
- `Power BI Dashboard/` — Power BI report and dashboard screenshots.

## Requirements
- Python 3.x
- Microsoft SQL Server
- SQL Server Management Studio (SSMS) or an equivalent SQL client
- Power BI Desktop
- Python libraries:
  - `pandas`
  - `requests`
  - `sqlalchemy`
  - The appropriate SQL Server database driver, if required by the connection method

## Setup and Execution
1. Clone or download this repository.
2. Install the required Python libraries.
3. Configure the SQL Server connection settings for your local environment.
4. Run the SQL database creation script.
5. Execute the Python ETL script or run the Jupyter Notebook to retrieve, transform, and load the data.
6. Run the SQL analysis queries to explore exchange rate metrics and trends.
7. Open the Power BI report in Power BI Desktop to explore the dashboard.

**Note:** Database connection settings may need to be adjusted for your local environment. Never publish passwords or sensitive credentials in the repository.

## Data Source
[Frankfurter API](https://api.frankfurter.dev/)
