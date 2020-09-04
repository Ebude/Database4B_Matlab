%% Dealing with Database Challenge
% Ebude Yolande
%%
% 1. Import "GeneratorRefilling.sqlite" and "3057.dat" and change the header of "3057.dat" to ['num','name','surname','date']
%%
% SQLite
conn=sqlite('GeneratorRefilling.sqlite');
query = "SELECT * FROM RefillingGen2018";
data=fetch(conn,query);
data=cell2table(data);
data.Properties.VariableNames = ["Generator","Buyer_Name","Purchase_Quantity","Purchase_Date","Purchase_Time","Payment","Mass","Generator_Amount","Refilling_Name","Refilling_Quantity","Refilling_Date","Refilling_Time", "Check"]; 
head(data,3);
%%
% Dat file
tab = datread();
tab=tab(:,1:4); % remove empty columns
tab.Properties.VariableNames = [{'num'},{'name'},{'surname'},{'date'}];
head(tab,3);
% 2. Create a table in the database for "3057.dat" called Tab3057
query= 'CREATE TABLE Tab3057 (num integer,name char(25),surname char(25),date date)';
exec(conn, query);
%%
% Add rows in new table
insert(conn,'Tab3057',{'num','name','surname','date'},tab);
%Check values of table
query = "SELECT * FROM Tab3057";
Tab3057=fetch(conn,query);
Tab3057=cell2table(Tab3057);
Tab3057.Properties.VariableNames = [{'num'},{'name'},{'surname'},{'date'}];
head(Tab3057,3);
%%
% 3. Delete the "Tab3055" table
query = "DROP TABLE Tab3055";
exec(conn, query);
%%
% 4. Add a row to Tab3057 table
query = "INSERT INTO Tab3057('num','name','surname','date') VALUES ('5','Peal','Johnny Walker','2014-01-23 17:47:55') ";
exec(conn, query);
%%
% 5. Delete a row of Tab3057
query = "DELETE FROM Tab3057 WHERE num='5'";
exec(conn, query);
%%
% 6. Add column 'verify' to Tab3057, assign 1 where num>50 and 0 else
query = "ALTER TABLE Tab3057 ADD verify Varchar(25)";
exec(conn, query);
% Assign 1 to num>50 and 0 else
query = "UPDATE Tab3057 SET verify='0'";
exec(conn, query);
query = "UPDATE Tab3057 SET verify='1' WHERE num>50";
exec(conn, query);