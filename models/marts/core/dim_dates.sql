/* placeholder for testing the BI tools integration
   TODO: replace with proper dim_dates logic */

select * from {{ ref('util_days') }}
