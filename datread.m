%% Import data from text file
% Script for importing data from the following text file:
%
%% Setup the Import Options
function df = datread()
    opts = delimitedTextImportOptions("NumVariables", 10);

    % Specify range and delimiter
    opts.DataLines = [1, Inf];
    opts.Delimiter = "\t";
    
    % Import the data
    df = readtable("...\3055.dat", opts); % put the path of the file 
    

    %% Clear temporary variables
    clear opts
end