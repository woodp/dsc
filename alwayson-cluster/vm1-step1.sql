USE [master]

GO

CREATE AVAILABILITY GROUP [SQLAO_AG]
WITH 
(
   AUTOMATED_BACKUP_PREFERENCE = PRIMARY,
   DB_FAILOVER = ON,
   DTC_SUPPORT = NONE
)
FOR DATABASE [Northwind]
REPLICA ON 
N'SQLAO-VM1' WITH 
(
   ENDPOINT_URL = N'TCP://SQLAO-VM1:5022', 
   FAILOVER_MODE = AUTOMATIC, 
   AVAILABILITY_MODE = SYNCHRONOUS_COMMIT, 
   SECONDARY_ROLE
   (
      ALLOW_CONNECTIONS = NO
   )
),
   
N'SQLAO-VM2' WITH 
(
   ENDPOINT_URL = N'TCP://SQLAO-VM2:5022',
   FAILOVER_MODE = AUTOMATIC, 
   AVAILABILITY_MODE = SYNCHRONOUS_COMMIT, 
   SECONDARY_ROLE
   (
      ALLOW_CONNECTIONS = NO)
   );
GO