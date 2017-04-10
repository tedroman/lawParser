function[termList,frequency]=parseFileDirectory(fileDir)
%take each of the files in a directory and run them through the word
%frequency algo
termList = {};
frequency = [];
%find all the .txt files
[status,fileNamesCell]=...
    system(['ls -R ' fileDir ' | grep "\.txt$"']);

if status~=0
    disp('ERROR: cannot file .txt files')
    return;
end

fileNamesCell = strsplit(fileNamesCell,'\n');

for i = 1:length(fileNamesCell)
   currentFileName = fileNamesCell{i};
   [status,currentFileNameFull]=...
       system(...
       ['find '...
       fileDir ' -type f -not -path '...
       '''*/\.*'''...
       '| grep "' currentFileName '"']);
   if status~=0
       disp(['ERROR: could not determine full file '...
           'path for ' currentFileName]);
       return;
   end
   
  tempFNCell = strsplit(currentFileNameFull,'\n');
  currentFileNameFull = tempFNCell{1};
  [termList,frequency]=addTermsFromFile(currentFileNameFull,...
      termList,frequency);
  
  disp(['Completed parsing file '...
      num2str(i) ' of ' num2str(length(fileNamesCell))])

end

end