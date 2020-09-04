%% Dealing with Database
% Ebude Yolande
%% 
% Introduction
%
% Nowadays, most companies use database to store information. 
% There are different kind of database but in this workshop we will handle Structured Query Language (SQL) type: SQLite. 
% To start download these datasets <a
% <href='https://drive.google.com/file/d/151p846LIvDjQD9WG3fRu2w5L2rQFZSK2/view?usp=sharing'>
%% 1. Import different database types
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
tab.Properties.VariableNames = [{'num'},{'val'},{'Firstname'},{'Lastname'},{'Email'},{'val1'},{'unit'},{'Date'},{'Datetime'},{'Verify'}];
head(tab,3);
%% 2 Modify database
% Create new table
query = 'CREATE TABLE Workers (id integer PRIMARYKEY, name char(25), time Date)';
exec(conn, query);
%%
% Create new table of an existing dataframe
query= 'CREATE TABLE Tab3055 (num integer,val real,Firstname char(25),Lastname char(25),Email char(25),val1 real,unit char(5),Date date, Datetime date,Verify char(25))';
exec(conn, query);
%%
% Add rows in new table
insert(conn,'Tab3055',{'num','val','Firstname','Lastname','Email','val1','unit','Date','Datetime','Verify'},tab); 
%Check values of table
query = "SELECT * FROM Tab3055";
Tab3055=fetch(conn,query);
Tab3055=cell2table(Tab3055);
Tab3055.Properties.VariableNames = [{'num'},{'val'},{'Firstname'},{'Lastname'},{'Email'},{'val1'},{'unit'},{'Date'},{'Datetime'},{'Verify'}];
head(Tab3055,3);
%%
% Delete rows in table
query= "DELETE FROM Tab3055 WHERE Firstname=='Mary'";
exec(conn, query);
%%
% Change a value in the table
query = "UPDATE Tab3055 SET Firstname='Peter' WHERE num='3'"; 
exec(conn, query);
%%
% close the database
close(conn);

%% Challenge
% * 1. Import "GeneratorRefilling.sqlite" and "3057.dat" and change the header of "3057.dat" to ['num','name','surname','date']
%
% * 2. Create a table in the database for "3057.dat" called Tab3057
%
% * 3. Delete the "Tab3055" table
%
% * 4. Add a row to Tab3057 table
%
% * 5. Delete a row of Tab3057
%
% * 6. Add column 'verify' to Tab3057, assign 1 where num>50 and 0 else


