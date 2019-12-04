------------# tables for Summary ----------
--
-- table: vmconfig
--
drop table   vmconfig;
create table vmconfig(
VMTYPE              varchar(100),
MAXVCPU             NUMERIC,
MAXIOPS             NUMERIC,
MAXMBPS             NUMERIC,
MAXSGA              NUMERIC,
ACTUALVCPU          NUMERIC,
ACTUALRAMGB         NUMERIC,
CENTSPERMONTHVCPU   NUMERIC,
CENTSPERMONTHRAMGB  NUMERIC
);

begin transaction;
insert into vmconfig values('hm-2',1,15000,40,6,2,13,0,0);
insert into vmconfig values('hm-4',2,15000,80,13,4,26,0,0);
insert into vmconfig values('hm-8',6,25000,160,26,8,52,0,0);
insert into vmconfig values('hm-16',14,25000,320,52,16,104,0,0);
insert into vmconfig values('hm-32',30,25000,640,104,32,208,0,0);
insert into vmconfig values('hm-64',61,25000,1300,208,64,416,0,0);
insert into vmconfig values('hm-96',93,25000,1950,312,96,624,0,0);
insert into vmconfig values('s-2',1,15000,40,3,2,7.5,0,0);
insert into vmconfig values('s-4',2,15000,80,7,4,15,0,0);
insert into vmconfig values('s-8',6,25000,160,15,8,30,0,0);
insert into vmconfig values('s-16',14,25000,320,30,16,60,0,0);
insert into vmconfig values('s-32',30,25000,640,60,32,120,0,0);
insert into vmconfig values('s-64',61,25000,1300,120,64,240,0,0);
insert into vmconfig values('s-96',93,25000,1950,180,96,360,0,0);
commit;


--
-- table: ssdlimits
--
drop table   ssdlimits;
create table ssdlimits(
CloudProvider     varchar(100),
FloorVolGB         NUMERIC,
VolSizeGB          NUMERIC,
IopsRead16k        NUMERIC,
IopsRead8k         NUMERIC,
IopsWrite16k       NUMERIC,
FloorMBpsRead      NUMERIC,
MBpsRead           NUMERIC,
MBpsWrite          NUMERIC
);

begin transaction;
insert into ssdlimits values('GCP',0,10,300,300,300,0,4.8,4.8);
insert into ssdlimits values('GCP',11,32,960,960,960,5,15,15);
insert into ssdlimits values('GCP',33,64,1920,1920,1920,16,30,30);
insert into ssdlimits values('GCP',65,128,3840,3840,3840,31,61,61);
insert into ssdlimits values('GCP',129,256,7680,7680,7680,62,122,122);
insert into ssdlimits values('GCP',257,500,15000,15000,15000,123,240,240);
insert into ssdlimits values('GCP',501,834,25000,25000,25000,241,400,400);
insert into ssdlimits values('GCP',835,1000,30000,30000,25000,401,480,400);
insert into ssdlimits values('GCP',1001,1334,40000,30000,25000,481,640,400);
insert into ssdlimits values('GCP',1335,1667,50000,30000,25000,641,800,400);
insert into ssdlimits values('GCP',1668,2048,60000,30000,25000,801,983,400);
insert into ssdlimits values('GCP',2049,4096,60000,30000,25000,984,1200,400);
--insert into ssdlimits values('GCP',4097,8192,60000,30000,25000,1200,1200,400);
--insert into ssdlimits values('GCP',8193,16384,60000,30000,25000,1200,1200,400);
--insert into ssdlimits values('GCP',16385,32768,60000,30000,25000,1200,1200,400);
--insert into ssdlimits values('GCP',32769,65536,60000,30000,25000,1200,1200,400);
commit;



--
-- table: hdlimits
--
drop table   pdlimits;
create table pdlimits(
CloudProvider     varchar(100),
FloorVolGB         NUMERIC,
VolSizeGB          NUMERIC,
IopsRead16k        NUMERIC,
IopsRead8k         NUMERIC,
IopsWrite16k       NUMERIC,
FloorMBpsRead      NUMERIC,
MBpsRead           NUMERIC,
MBpsWrite          NUMERIC
);

begin transaction;
insert into pdlimits values('GCP',0,32,24,48,48,0,3,3);
insert into pdlimits values('GCP',33,64,24,48,48,4,7,7);
insert into pdlimits values('GCP',65,128,96,192,192,8,15,15);
insert into pdlimits values('GCP',129,256,192,384,384,16,30,30);
insert into pdlimits values('GCP',257,512,384,768,768,31,61,61);
insert into pdlimits values('GCP',513,1000,750,1500,1500,62,120,120);
insert into pdlimits values('GCP',1001,1500,1125,2250,2250,121,180,180);
insert into pdlimits values('GCP',1501,2048,1536,3072,3072,181,240,240);
--insert into pdlimits values('GCP',2049,4000,3000,6000,6000,241,240,240);
commit;



--
-- table: dbdetails
--

drop table dbdetails;
create table dbdetails(
DBNAME           varchar(100),
AAS              NUMERIC,
SGA              NUMERIC,
MBPS             NUMERIC,
IOPS             NUMERIC,
GB               NUMERIC,
CENTSPERMONTH    NUMERIC
);

-- begin transaction;
-- insert into dbdetails values('OLTP1',7,24,110,1500,350,0);
-- insert into dbdetails values('BATCH1',15,64,200,200,700,0);
-- insert into dbdetails values('REPO1',2,12,20,30,60,0);
-- insert into dbdetails values('APP2',6,64,90,120,200,0);
-- insert into dbdetails values('DW1',35,128,500,1500,7340,0);
-- commit;


--
-- table awr_raw
--
drop table awr_raw;
create table awr_raw(
collection_host varchar(100),
collection_key varchar(100),
category varchar(100),
data_element varchar(100),
source varchar(100),
instance_number NUMERIC,
inst_id NUMERIC,
value NUMERIC
);


--
-- table: trackconfig
--
drop table   trackconfig;
create table trackconfig(
Track              VARCHAR(100),
Environment        VARCHAR(100),
ServerGroup        VARCHAR(100),
DBRole             VARCHAR(100),
escpdirectory      VARCHAR(100),
escpdbname         VARCHAR(100)
);

begin transaction;
-- PROD --
insert into trackconfig values('UKOUG','PROD','PRODBATCH','PRIMARY','/Users/karundutt/escp-Solver/db','solver.db');
commit;

----
---- table: snapshots
----
drop table   retainsnapshots;
create table retainsnapshots(
DBNAME                varchar(100),
IOPS                    INTEGER,
MBPS                    INTEGER,
VCPU                    INTEGER,
SGA                     INTEGER,
GB                      INTEGER,
DataDiskGB              INTEGER,
TRACK              VARCHAR(100),
ENVIRONMENT        VARCHAR(100),
SERVERGROUP             varchar(100),
DBROLE                  varchar(100),
SNAPSHOT               INTEGER,
ITERATION              INTEGER,
MAXIOPS                 NUMERIC,
MAXMBPS                 NUMERIC,
MAXVCPU                 NUMERIC,
MAXSGA                  NUMERIC,
VMTYPE                  VARCHAR(100),
VMVCPU                  NUMERIC,
VMRAMGB                 NUMERIC,
VMCENTSPERMONTH         NUMERIC
);

------------    END --------------------------------------------------#
