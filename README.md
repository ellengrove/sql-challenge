# sql-challenge

## Description

We are tasked with reviewing a collection of .csv data files about a company's employees and constructing a PostgreSQL database that relates the .csv files to one another based on common variables. The SQL script schema.sql constructs this database based on the entity relationship diagram in ERD.png. The SQL script queries.sql performs variious queries on the database to return information about employees, departments, salaries, and titles.

## Technologies

Python, Matplotlib, PostgreSQL, SQLAlchemy, Jupyter Notebook, Pandas

## Additional Analysis

The jupyter notebook titled analysis.ipynb converts several of the tables within the employees_db database into pandas dataframes and performs additional analysis on them in order to determine whether the database data is dummy data. Specifically, it plots a histogram of employee salaries and a bar chart of average employee salary by job title. While the distribution of employee salaries is not in and of itself concerning, the bar chart plotting average salary by title shows that the average salary regardless of title is between $48,000 and $60,000. Furthermore, it shows senior staff making approximately the same on average as regular staff members, and assistant engineers making approximately the same as engineers and senior engineers. This analysis supports the theory that the data is dummy data. 

