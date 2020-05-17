%function [DataAll]=LoadData()
FolderBase='C:\Users\habib\Dropbox\msc research\ALL AAFC DATA\Nitrogen experiment\soyabean';
files=dir(FolderBase);
DataVIS=[];
DataNIR=[];


sub_VIS=[FolderBase '/VIS'];
sub_NIR=[FolderBase '/NIR'];
        
sub_VIS_DIR=dir(sub_VIS);
sub_NIR_DIR=dir(sub_NIR);

c_NIR=struct2cell(sub_NIR_DIR);
c_VIS=struct2cell(sub_VIS_DIR);

c_VIS_name=natsortfiles(c_VIS(1,3:numel(sub_VIS_DIR)));
c_NIR_name=natsortfiles(c_NIR(1,3:numel(sub_NIR_DIR)));

        for k=1:numel(c_VIS_name)
            FileName=[sub_VIS '/' cell2mat(c_VIS_name(k))];
            ReadTemp= xlsread(FileName);
            ReadTemp=ReadTemp(:,1:6);
            [idx,C] = kmeans(ReadTemp,3);      
            DataVIS=[DataVIS; C];        
        end
        for k=1:numel(c_NIR_name)
            FileName=[sub_NIR '/' cell2mat(c_NIR_name(k))];
            ReadTemp= xlsread(FileName);
            ReadTemp=ReadTemp(:,1:6);
            [idx,C] = kmeans(ReadTemp,3);      
            DataNIR=[DataNIR; C];
        end
DataAll=[DataVIS DataNIR];


