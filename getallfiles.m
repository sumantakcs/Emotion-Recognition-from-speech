%fileList = getAllFiles(dirName, fileExtension, appendFullPath,fp)
This Function intends to extract files 
function fileList = getAllFiles(dirName, fileExtension, appendFullPath,fp)
dirData= dir([dirName '/' fileExtension]);
dirWithSubFolders = dir(dirName);
dirIndex = [dirWithSubFolders.isdir];
fileList = {dirData.name};
if ~isempty(fileList)
    if appendFullPath
        fileList = cellfun(@(x) fullfile(dirName,x),...
            fileList,'UniformOutput',false);
    end
end
for i=1:length(fileList)
    x = fileList{i};
    %         fprintf(fp, 'in File');
    fprintf(fp,'%s\\%s',dirName,x);
    fprintf(fp, '\n');
end

subDirs = {dirWithSubFolders(dirIndex).name};
validIndex = ~ismember(subDirs,{'.','..'});

for iDir = find(validIndex)
    nextDir = fullfile(dirName,subDirs{iDir});
    fileList = [fileList; getAllFiles(nextDir, fileExtension, appendFullPath,fp)];
    %     B = transpose(fileList)
    %     fprintf(fp, 'before for');
    %     B
    for i=1:length(fileList)
        x = fileList{i};
        %         fprintf(fp, 'in File');
        fprintf(fp,'%s\%s',nextDir,x);
        fprintf(fp, '\n');
    end
    
end

end