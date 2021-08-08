# Talend-importSubscriptionData
Talend Job to import Subscription (Service subscription) data in to subscription table in Postgres database and update insert missing Subscribers (Subscriber Profile) in to subscriber table with default attributes. 

![alttext](./images/TalendJob.PNG?raw=true)


## Import and Build in Talend OpenStudio
This [Talend project](./TALEND_IMPORTSUBSCRIPTIONS) can be imported and build in Talend open studio for ESB.

![alttext](./images/ImportProject.PNG?raw=true)

## Prerequisites

### PostgreSQL database
In this project data in a csv fille list will be imported to PostgreSQL database. 
A PostgreSQL database needs to be preconfigured. The database schema `(with sample data)` is included in [database-PostgreSQL](./database-PostgreSQL) directory.

`Sample subscription table`

![alttext](./images/Postgres-Subscription-Table.PNG?raw=true)


## Project configuration

Context variables needs to be congured according to the envirionment as mentioned below

| Context Variable | Description  |
--- | ---
| postgresHost | PostgreSQL database host IP| 
| postgresPort | PostgreSQL database port| 
| postgresDatabase | PostgreSQL database name| 
| postgresUser | PostgreSQL database username| 
| postgresPass | PostgreSQL database password| 
| postgresService | Service master data table name |
| postgresSubscriber | Subscriber table name |
| postgresSubscription | Subscription table name |
| subsSkipped | Relative dir path to store skppied records |
| subsInvalid | Relative dir path to store invalid records |
| subsSource | Relative dir path to read source files |
| subsCompleted | Relative dir path to store completed files |
| subsRoot | Absolute dir path for root of the dir structure | 
| default_operator_id | Default Subscriber operator id|
| default_cus_type | Default Subscriber type id|
| default_pref_lang | Default Subscriber preferred language|
| default_sub_status_id | Default Subscriber status id|
| default_status_detail_id | Default Subscriber status detail id|
| default_p_offer_id | Default Subscriber primary offer id|
| default_brand_id | Default Subscriber brand id|
| default_loyalty_id | Default Subscriber loyalty id|
| default_category_id | Default Subscriber category id|
| default_device_model_id | Default Subscriber device model id|



`Example Configuration`

![alttext](./images/Talend-Context-Var.PNG?raw=true)

`Example Directory Structure`

![alttext](./images/Sample-Directory-Structure.PNG?raw=true)

A Sample data set is in  [my_sample_data](./my_sample_data) directory.


## How it works
Location configured as `subsRoot` will be considered as the root directory for all the directory relative paths. 
1. CSV file list in location configured as `subsSource` will be read sequencially and validate.
  - Validate against schema structure
  - Validate against data type/length constrains
  and invalid records will be written to the file with name `source_file_name + '_subs_invalid'`
2. Subscriber master data table configured as `postgresSubscriber` will be looked up by `Msisdn` for data availability and insert if not available.
3. Service table configured as `postgresService` will be looked up by `Service_code` for data availability.
  - If Service is available, subscription recored will be inserted to subscription table configured as `postgresSubscription`.
  - Other wise file record will be skipped and relevant data will be written to the file with `source_file_name + '_subs_skipped'`
4. Completed file will be rename to `source_file_name + '_completed'` and moved to the location congired as `subsCompleted`

## Output result files

Completed files will be renamed and move to location specified in `subsCompleted` relative path.

![alttext](./images/Sample-Completed.PNG?raw=true)

Invalid recored in completed files will be renamed and move to location specified in `subsInvalid`  relative path.

![alttext](./images/Sample-Invalid.PNG?raw=true)

Skipped recored in completed files will be renamed and move to location specified in `subsSkipped`  relative path.

![alttext](./images/Sample-Skipped.PNG?raw=true)
