function[]=lawParser(fileDir)
%this is the main function that will run the file parser
%and also conduct some brief analysis post-run.

%it assumes the files are located somewhere in the file directory
[termList,frequency]=parseFileDirectory(fileDir);

%this parses the files.

%next up is to run a bit of analysis
[~,sortIdx] = sort(frequency,1,'descend');

disp('Top 10 most common words: ');
disp(termList(sortIdx(1:10),:));
disp(' ');



%next, if we assume that words are neg. binom. distributed
%(which is probably not true but we can come up with a better model later)
%then which words are statistically enriched?

meanFreq = mean(frequency);
stdFreq = std(frequency);
disp('Highly enriched words:');
disp(termList(frequency > meanFreq + 3*stdFreq,:));

end