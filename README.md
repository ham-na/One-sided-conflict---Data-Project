
# One-Sided Conflict - Analysis Project

## Data Source
**Dataset**: UCDP One-sided Violence Dataset version 24.1  

**Description**: An actor-year dataset with information on intentional attacks on civilians by governments and formally organized armed groups.  

**Link**: [UCDP One-sided Violence Dataset](https://ucdp.uu.se/downloads/index.html#candidate)

## Process
- **Data Exploration**: Using MySQL
- **Data Visualization**: Using Tableau
  
## Findings

- [Sql file](https://github.com/ham-na/sql-dump/blob/main/One_sided_conflict.sql)

### Personal Favorite Findings
- **Incident Frequency vs. Fatalities Over Time**: 
  - The frequency of incidents increased after the 2000s, but the number of fatalities was higher in the 1900s.
  - This suggests that while incidents have become more frequent in recent years, they have become less deadly, potentially due to improved safety measures, better emergency responses, or advancements in technology.
- **Disparity in Fatality Estimates**:
  - The disparity between high and low fatality estimates is significantly greater (20 times) when the government is involved compared to non-government actors.
  - This highlights the potential for information suppression or manipulation in government-involved incidents, reflecting either a lack of transparency or significant variability in reporting standards.

### Incidents and Fatalities Analysis

- **Total Incidents Reported**: 1,262
- **Total Fatalities Reported**: 1,165,818
- **Average Fatalities per Incident**: 924

### Actors Involved Analysis

- **Unique Actors Involved**: 341
- **Number of Actors with "Army" in Their Name**: 86
- **Top Actors Involved in One-Sided Violence**:
  - Government of Sudan: 32
  - Government of Democratic Republic of the Congo (Zaire): 28
  - Government of Myanmar (Burma): 28
- **Actor with the Highest Fatalities in a Single Year**: Government of Rwanda
- **Average Fatality Estimates Comparison**:
  - Government Actors: 2,098
  - Non-Government Actors: 291

### Government vs. Non-Government Actors Analysis

- **Percentage of Incidents Involving Government Actors**: 54%
- **Discrepancy in Fatality Estimates with Government Involvement**:
  - Average Difference Between High and Low Fatality Estimates (Government): 3,133
  - Average Difference Between High and Low Fatality Estimates (Non-Government): 158

### Temporal Analysis

- **Top 5 Years with the Highest Total Fatalities**:
  - 1990: 9,863
  - 1991: 9,739
  - 2017: 9,252
  - 2020: 8,880
  - 2001: 8,879
- **Trends and Changes in Fatality Estimates Over Decades**:
  - 1990 - 1999: 960,260
  - 2000 - 2009: 80,083
  - 2010 - 2023: 125,475

### Geographical Analysis

- **Locations with the Highest Number of Incidents**:
  - **DR Congo (Zaire)**: 149
  - **India**: 106
  - **Colombia**: 54

### Coalition Components and Collaboration Analysis

- **Top Actors with Most Frequent Collaboration**:
  - Actors: Serbian Irregulars, Serbian Republic of Bosnia-Herzegovina
  - Number of Coalition Incidents: 4
- **Correlation Between Coalition Components and Fatality Estimates**:
  - Average Fatality Estimate (Coalition): 881
  - Average Fatality Estimate (No Coalition): 925

## Visualizations

![Dashboard 1 Screenshot](https://github.com/ham-na/sql-dump/blob/main/Number%20of%20incidents%20per%20year.png?raw=true)
![Dashboard 2 Screenshot](https://github.com/ham-na/sql-dump/blob/main/Number%20of%20incidents%20per%20location.png?raw=true)
![Dashboard 3 Screenshot](https://github.com/ham-na/sql-dump/blob/main/Fatality%20density.png?raw=true)

[Interactive Version](https://public.tableau.com/views/One-sidedconflictanalysis2/Dashboard12?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)

**Contact Email**: hamna.rehman88@gmail.com
