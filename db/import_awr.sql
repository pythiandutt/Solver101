.mode csv

.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_APP_20191203_1159.csv awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_BATCH_20191203_1155.csv  awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_DW_20191203_1159.csv awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_OLTP1_20191203_1148.csv awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_REPO_20191203_1155.csv awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_WEBA_20190410_1131.csv awr_raw
.import /Users/karundutt/escp-Solver/data/prod/esp_requirements_awr_racn01_WEBB_20190410_1141.csv awr_raw


-- We will remove all numbers from collection_key
begin transaction;
UPDATE awr_raw SET collection_key = replace(collection_key, '0', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '1', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '2', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '3', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '4', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '5', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '6', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '7', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '8', '' );
UPDATE awr_raw SET collection_key = replace(collection_key, '9', '' );
commit;
-- Now we will start to collect metrics individually into dbdetails
-- First insert the distinct database names

begin transaction;
insert into dbdetails(DBNAME) select collection_key from awr_raw group by collection_key;
delete from dbdetails where dbname = 'collection_key';
commit;

-- Next Inset DB size
begin transaction;
update dbdetails 
set GB =  (select round(value/1024/1024/1024) from awr_raw r
              where trim(r.category) = 'db_size' and trim(r.data_element) = 'total' and r.inst_id = -1 and r.collection_key=dbdetails.dbname);
commit;
-- Next Get SGA
begin transaction;
update dbdetails
set SGA =  (select round(value/1024/1024/1024) from awr_raw r
              where trim(r.category) = 'mem' and trim(r.data_element) = 'sga_max_size' and trim(r.source) = 'dba_hist_parameter' and r.inst_id = -1 and r.collection_key=dbdetails.dbname);
commit;

--- Get IOPS
begin transaction;
update dbdetails
set IOPS =  (select round(value) from awr_raw r
              where trim(r.category) = 'disk_perf' and trim(r.data_element) = 'rw_iops_97' and trim(r.source) = 'dba_hist_sysstat' and r.inst_id = -1 and r.collection_key=dbdetails.dbname);
commit;

-- Get AAS
begin transaction;
update dbdetails
set AAS =  (select round(value) from awr_raw r
              where trim(r.category) = 'cpu' and trim(r.data_element) = 'aas_on_cpu_and_resmgr_97' and trim(r.source) = 'dba_hist_active_sess_history' and r.inst_id = -1 and r.collection_key=dbdetails.dbname);
commit;

--- GET MBPS
begin transaction;
update dbdetails
set MBPS =  (select round(value) from awr_raw r
              where trim(r.category) = 'disk_perf' and trim(r.data_element) = 'rw_mbps_97' and trim(r.source) = 'dba_hist_sysstat' and r.inst_id = -1 and r.collection_key=dbdetails.dbname);
commit;

