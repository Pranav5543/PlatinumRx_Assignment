# PlatinumRx Data Analyst Assignment

## Folder Structure

```
PlatinumRx_Assignment/
│
├── SQL/
│   ├── Hotel/
│   │   ├── 01_Hotel_Schema_Setup.sql         ← Tables + sample data
│   │   ├── 02_Hotel_Q1_Last_Booked_Room.sql  ← Q1: Last booked room per user
│   │   ├── 03_Hotel_Q2_Nov2021_Billing.sql   ← Q2: Total billing Nov 2021
│   │   ├── 04_Hotel_Q3_Bills_Over1000.sql    ← Q3: Bills > 1000 in Oct 2021
│   │   ├── 05_Hotel_Q4_Most_Least_Ordered.sql← Q4: Most/Least ordered item
│   │   └── 06_Hotel_Q5_Second_Highest_Bill.sql← Q5: 2nd highest bill per month
│   │
│   └── Clinic/
│       ├── 01_Clinic_Schema_Setup.sql              ← Tables + sample data
│       ├── 02_Clinic_Q1_Revenue_By_Channel.sql     ← Q1: Revenue by sales channel
│       ├── 03_Clinic_Q2_Top10_Customers.sql        ← Q2: Top 10 customers
│       ├── 04_Clinic_Q3_Monthly_Profit_Loss.sql    ← Q3: Month-wise profit/loss
│       ├── 05_Clinic_Q4_Most_Profitable_Per_City.sql  ← Q4: Most profitable per city
│       └── 06_Clinic_Q5_Second_Least_Profitable_Per_State.sql ← Q5: 2nd least per state
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx     ← 3 sheets: ticket, feedbacks, analysis 
    LINK : https://1drv.ms/x/c/7bc9d80e32af67ce/IQAHV8q2hZewT4xG0PnXYLsVAWXUEsg8vv6saVHnguxyoJE?e=e2cDWx  
│
├── Python/
│   ├── 01_Time_Converter.py     ← Convert minutes to hrs & minutes
│   └── 02_Remove_Duplicates.py  ← Remove duplicate characters using loop
│
└── README.md

```

## How to Run

### SQL
1. Run the Schema Setup file first to create tables and insert data
2. Then run each Question file individually in MySQL Workbench / DB Fiddle

### Spreadsheet
- Open Ticket_Analysis.xlsx in Excel or Google Sheets
- Sheet 1: ticket (raw data)
- Sheet 2: feedbacks (with INDEX-MATCH formula in column D)
- Sheet 3: analysis (Same Day / Same Hour helper columns + outlet summary)

### Python
```bash
python 01_Time_Converter.py
python 02_Remove_Duplicates.py
```
