# Nashville-Housing-Data-Cleaning-
**Nashville Housing Data Cleaning Project**

Welcome to the Nashville Housing Data Cleaning Project! This repository contains scripts and SQL queries used to clean and refine housing data for the vibrant city of Nashville, Tennessee. 

**Project Overview:**
In this project, we aimed to enhance the quality and reliability of housing data collected for Nashville. By employing SQL queries and functions, we addressed various data quality issues such as inconsistent date formats, missing property addresses, and duplicate entries. The cleaned dataset provides a solid foundation for insightful analysis and informed decision-making in the realm of real estate and housing projects.

*Key Steps:**
1.**Selecting Data:** We began by selecting all housing data available for Nashville, laying the groundwork for further analysis.
2. **Standardize Date Format:** Utilizing SQL’s `CONVERT` function, we standardized date formats throughout the dataset, ensuring consistency and accuracy.
3. **Populate Property Address Data:** Addressing missing data with precision, we completed property addresses using the `ISNULL` function and self-joins, fostering a comprehensive understanding of Nashville’s housing inventory.
4. **Breaking out Address into Individual Columns:** By dissecting addresses into distinct components using `SUBSTRING` and `CHARINDEX` functions, we enhanced data clarity, facilitating targeted analysis of geographic trends.
5. **Changing Y and N to Yes and No:** Employing clear language conventions, we replaced coded values with universally understandable terms using the `CASE` statement, enhancing dataset readability.
6. **Remove Duplicates:** With a focus on data integrity, we eliminated redundant entries using the `ROW_NUMBER` function within a Common Table Expression (CTE), ensuring analytical accuracy and coherence.
7. **Delete Unused Columns:** Guided by a commitment to efficiency, we streamlined the dataset by removing unnecessary columns using the `ALTER TABLE` statement, optimizing it for insightful analysis.

**Usage:**
Feel free to explore the SQL scripts provided in this repository to understand the data cleaning process undertaken for the Nashville housing dataset. These scripts can serve as a reference for similar data cleaning tasks in your projects.

**Contributing:**
If you have any suggestions or improvements for the data cleaning process, feel free to open an issue or submit a pull request. Your contributions are highly appreciated!

Thank you for visiting the Nashville Housing Data Cleaning Project repository. Happy analyzing!
