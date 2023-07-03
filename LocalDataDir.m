function LocalDataDir = LocalDataDir()

%identifies which machine we're using, and sets the path to the data store directory accordingly
TheComputerThisIsOn = upper(char(java.net.InetAddress.getLocalHost.getHostName));

%set data directory path
if strcmp(TheComputerThisIsOn,'DESKTOP-JK703NO');
  LocalDataDir = 'C:\Data\';
elseif isunix 
  LocalDataDir = '/u/i/pb948/Data';
end


return