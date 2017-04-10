function[termListNew,frequencyNew]=addTermsFromFile(filename,termList,frequency)
%take the current List of terms (words), and add to it the words that are
%novel in the file (txt) specified by filename.  Then, add the frequency of
%all words, both those appearing in the previous termList, the new
%termList, and the frequency vector
punctuationVec = [',','!','.','#','?','(',')','”','“','_',...
    '1','2','3','4','5','6','7','8','9','0'];


fid = fopen(filename,'r');

%ensure filename is viable
if fid ==-1
    disp('Error, filename not specified properly')
    return;
end
%given that filename is viable, read the file in
tline = fgetl(fid);
while ischar(tline)
   
    tline = fgetl(fid);
    if ischar(tline)
        tline = strtrim(tline);
    else
        break;
    end
    stringCell = strsplit(tline);
    
    %now go through each of the strings in the cell
    for i = 1:length(stringCell)
       currString = stringCell{i};
       loc = ismember(currString,punctuationVec);
       if sum(double(loc)) > 0
          %need to trim punctuation
          currString = currString(loc==0);
       end
       
       %trimmed version.
       
       %what is the index of currString in termList?
       if ~isempty(termList)
            idx = 0;
            for j = 1:length(termList)
                if iscell(termList) && strcmpi(currString,termList{j})
                    idx = j;
                    break;
                end
            end

       end
       if isempty(termList) || idx < 1
           %new term
           if ischar(termList)
               termListCell = {termList};
               termList = termListCell;
               clearvars termListCell;
           end
          termList = [termList lower(currString)];
          frequency = [frequency;1];
       else
           %increment the index
           frequency(idx) = frequency(idx)+1;
       end
    end
    
end


%close the file
fclose(fid);
termListNew = char(termList);
frequencyNew = frequency;


end