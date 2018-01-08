% Final Year project:Emotion Recognition System for Bengali Language
% Duration:Januray 2015 - July 2015
% College Name:Academy of Technology, Adisaptagram
% Authors:Sumanta Bhattacharya
% Objective:
%               1. To build train model of emotional speech data
%               2. To identify Emotional Aspect in speech signals
% Description:  1. Training: Calculate LPC, LAR speech features with VQ clustering for 32, 64 and 128 code book size
%               2. Testing: Extract LPC and LAR from unknown sample data and calculate euclidean distence for corresponding code books
%               3. Result: Provide rankwise unknown data result
% Input:
%                 1. Training: Speech Database for Emotion for Training
%                 2. Testing:
% Output: Trained emotion models and target Emotion of an unknown voice sample
% Dependencies:This system is only trained to 7 usual emotion namely ....
% Guided By: Centre for development of Advanced Computing,Kolkata and Prof. T. K. Basu, AOT

clear;
fprintf('welcome to emotion recognition system');
fprintf('\n what do you want\n press 1 for training\tor press 2 for testing\tor press 3 for exit');
mychoice=input('\n enter the number:');

while 1
    switch mychoice
        case 1
            disp('training');
            fprintf('\n welcome to training session');
            fprintf('\n');
            fprintf('type of emotion');
            fprintf('\n');
            fprintf('\n choice of emotion for feature extraction');
            fprintf('\n options following\t 1.happiness\t2.sadness\t3.anger\t4.surprise\t5.disgust\t6.fear\t7.boredom\t\n');
            mynumber = input('enter a number:');
            switch mynumber
                case 1
                    disp('happiness');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('happiness_32.vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('happiness_64.vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('happiness_128.vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                        
                    end
                case 2
                    disp('sadness');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('sad 32 vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('sad 64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('sad 128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
                    
                case 3
                    disp('anger');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('anger_32 vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('anger_64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('anger 128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
                case 4
                    disp('surprise');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                fp = fopen('surprise 32 vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('surprise 64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('surprise 128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
                case 5
                    disp('disgust');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('disgust 32 vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('disgust 64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('disgust 128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
                case 6
                    disp('fear');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('fear 32 vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('fear 64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('fear 128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
                case 7
                    disp('boredom');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    totallpc=calculatelpc(str);
                    fprintf('\n clustering session');
                    fprintf('\n select codebook size');
                    fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                    fprintf('\n');
                    mycodebook = input('enter a codebook number:');
                    while 1
                        switch mycodebook
                            case 1
                                disp('32 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),32);
                                fp = fopen('boredom_32.vq','w');
                                for k=1:32
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 2
                                disp('64 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),64);
                                fp = fopen('boredom 64 vq','w');
                                for k=1:64
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            case 3
                                disp('128 bits');
                                [x,esq,j]=kmeanlbg(totallpc([2:end],:),128);
                                fp = fopen('boredom_128 vq','w');
                                for k=1:128
                                    for p=1:12
                                        fprintf(fp,'%f\t',x(k,p));
                                    end %for tab
                                    fprintf(fp,'\r\n');
                                end
                                fclose(fp);
                                break;
                            otherwise
                                disp('unknown input please refer to the right inputs');
                                fprintf('\n options following\t 1.32bits\t2.64bits\t\t3.128 bits');
                                fprintf('\n');
                                mycodebook = input('enter a codebook number:');
                                continue;
                        end
                    end
            end
            fprintf('\n training sucessful');
        case 2
            clear;
            disp('testing');
            fprintf('\n welcome to testing segment');
            fprintf('\n');
            fprintf('let begin feature extraction\n');
            fprintf('1.lpc\t2.lar\t\n');
            myfeature=input('\n enter feature number');
            switch myfeature
                case 1
                    disp('lpc');
                    prompt = 'path please?';
                    str = input(prompt,'s');
                    if isempty(str)
                        str = 'y';
                    end
                    fp1 = fopen('FileNameTesting.txt','w');
                    fileList = getallfiles(str,'*.wav',0,fp1);
                    fclose(fp1);
                    fp1 = fopen('FileNameTesting.txt','r');
                    while ~feof(fp1)
                        A = fgets(fp1);
                        B = strtrim(A); %wav file name with path
                        len1 = length(B);
                        totallpc=calculatelpctesting(B);
                        
                        fprintf('\n calculation of distance for testing purpose');
                        fprintf('\n codebook number for which you decide your distance');
                        fprintf('\n 1.32  2.64  3.128');
                        mydistance = input('enter codebook information regarding distance:');
                        while 1
                            switch mydistance
                                case 1
                                    disp('32bits');
                                    fprintf('\n calculate distance with existing samples');
                                    x_happiness=importdata('happiness_32.vq');
                                    d=disteusq(x_happiness,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg1=mean(min_d(i));
                                    x_sadness=importdata('sad 32 vq');
                                    d=disteusq(x_sadness,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg2=mean(min_d(i));
                                    x_anger=importdata('anger_32 vq');
                                    d=disteusq(x_anger,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg3=mean(min_d(i));
                                    x_surprise=importdata('surprise 32 vq');
                                    d=disteusq(x_surprise,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg4=mean(min_d(i));
                                    x_disgust=importdata('disgust 32 vq');
                                    d=disteusq(x_disgust,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg5=mean(min_d(i));
                                    x_fear=importdata('fear 32 vq');
                                    d=disteusq(x_fear,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg6=mean(min_d(i));
                                    x_boredom=importdata('boredom_32.vq');
                                    d=disteusq(x_boredom,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:32
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg7=mean(min_d(i));
                                    fp=fopen('distance32.txt','w');
                                    for i=1:1:length(fileList)
                                      fprintf(fp,'\r\n\r\nName of the file:\t%s\r\n',fileList{i});
                                    fprintf(fp,'\r\n');
                                    fprintf(fp,'%f\t',avg1,avg2,avg3,avg4,avg5,avg6,avg7);
                                     fprintf(fp,'\r\n');
                                    d=[avg1,avg2,avg3,avg4,avg5,avg6,avg7];
                                    [b,i]=sort(d);
                                     fprintf(fp,'\r\n the ascending order');
                                    fprintf(fp,'\r\n');
                                   fprintf(fp,'%f\t\t',(b));
                                    for k=1:1:7
                                        switch i(k)
                                            case 1
                                                
                                                fprintf(fp,'\r\n happiness\t');
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 2
                                                
                                                fprintf(fp,'\r\n sadness\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 3
                                                
                                                fprintf(fp,'\r\n anger\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 4
                                                
                                                fprintf(fp,'\r\n surprise\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 5
                                                
                                                fprintf(fp,'\r\n disgust\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 6
                                                
                                                fprintf(fp,'\r\n fear\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 7
                                                
                                                fprintf(fp,'\r\n boredom\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                        end
                                    end
                                    end
                                    fclose(fp);
                                    break;
                                    
                                    
                                case 2
                                    disp('64bits');
                                    fprintf('\n calculate distance with existing emotions');
                                    x_happiness64=importdata('happiness_64.vq');
                                    d=disteusq(x_happiness64,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg1=mean(min_d(i));
                                    x_sadness64=importdata('sad 64 vq');
                                    d=disteusq(x_sadness64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg2=mean(min_d(i));
                                    x_anger64=importdata('anger_64 vq');
                                    d=disteusq(x_anger64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg3=mean(min_d(i));
                                    x_surprise64=importdata('surprise 64 vq');
                                    d=disteusq(x_surprise64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg4=mean(min_d(i));
                                    x_disgust64=importdata('disgust 64 vq');
                                    d=disteusq(x_disgust64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg5=mean(min_d(i));
                                    x_fear64=importdata('fear 64 vq');
                                    d=disteusq(x_fear64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg6=mean(min_d(i));
                                    x_boredom64=importdata('boredom 64 vq');
                                    d=disteusq(x_boredom64,totallpc);
                                    [m n]=size(d)
                                    for i=1:64
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg7=mean(min_d(i));
                                    fp=fopen('distance64.txt','w');
                                    for i=1:1:length(fileList)
                                      fprintf(fp,'\r\n\r\nName of the file:\t%s\r\n',fileList{i});
                                    fprintf(fp,'\r\n');
                                    fprintf(fp,'%f\t',avg1,avg2,avg3,avg4,avg5,avg6,avg7);
                                    fprintf(fp,'\r\n');
                                    d=[avg1,avg2,avg3,avg4,avg5,avg6,avg7];
                                    [b,i]=sort(d);
                                    fprintf(fp,'\r\n the ascending order');
                                    fprintf(fp,'\r\n');
                                    
                                    fprintf(fp,'%f\t\t',(b));
                                    for k=1:1:7
                                        
                                        switch i(k)
                                            case 1
                                                
                                                fprintf(fp,'\r\n happiness\t');
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 2
                                                
                                                fprintf(fp,'\r\n sadness\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 3
                                                
                                                fprintf(fp,'\r\n anger\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 4
                                                
                                                fprintf(fp,'\r\n surprise\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 5
                                                
                                                fprintf(fp,'\r\n disgust\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 6
                                                
                                                fprintf(fp,'\r\n fear\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 7
                                                
                                                fprintf(fp,'\r\n boredom\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                        end
                                    end
                                    end
                                    
                                    fclose(fp);
                                    break;
                                case 3
                                    disp('128bits');
                                    fprintf('\n calculate distance with existing emotions');
                                    disp ('happiness')
                                    x_happiness128=importdata('happiness_128.vq');
                                    d=disteusq(x_happiness128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg1=mean(min_d(i));
                                    x_sad128=importdata('sad 128 vq');
                                    d=disteusq(x_sad128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg2=mean(min_d(i));
                                    x_anger128=importdata('anger 128 vq');
                                    d=disteusq(x_anger128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg3=mean(min_d(i));
                                    x_surprise128=importdata('surprise 128 vq');
                                    d=disteusq(x_surprise128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg4=mean(min_d(i));
                                    x_disgust128=importdata('disgust 128 vq');
                                    d=disteusq(x_disgust128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg5=mean(min_d(i));
                                    x_fear128=importdata('fear 128 vq');
                                    d=disteusq(x_fear128,totallpc,'s');
                                    [m n]=size(d)
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg6=mean(min_d(i));
                                    x_boredom128=importdata('boredom_128 vq');
                                    d=disteusq(x_boredom128,totallpc,'s');
                                    [m n]=size(d);
                                    for i=1:128
                                        min_d(i)=min(d(i,:));
                                    end
                                    avg7=mean(min_d(i));
                                    fp=fopen('distance128.txt','w');
                                    for i=1:1:length(fileList)
                                      fprintf(fp,'\r\n\r\nName of the file:\t%s\r\n',fileList{i});
                                    fprintf(fp,'\r\n');
                                    fprintf(fp,'%f\t',avg1,avg2,avg3,avg4,avg5,avg6,avg7);
                                    fprintf(fp,'\r\n');
                                    d=[avg1,avg2,avg3,avg4,avg5,avg6,avg7];
                                    [b,i]=sort(d);
                                    fprintf(fp,'\r\n the ascending order');
                                    fprintf(fp,'\r\n');
                                    
                                    fprintf(fp,'%f\t\t',(b));
                                    for k=1:1:7
                                        
                                        switch i(k)
                                            case 1
                                                
                                                fprintf(fp,'\r\n happiness\t');
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 2
                                                
                                                fprintf(fp,'\r\n sadness\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 3
                                                
                                                fprintf(fp,'\r\n anger\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                                
                                            case 4
                                                
                                                fprintf(fp,'\r\n surprise\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 5
                                                
                                                fprintf(fp,'\r\n disgust\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 6
                                                
                                                fprintf(fp,'\r\n fear\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                            case 7
                                                
                                                fprintf(fp,'\r\n boredom\t');
                                                
                                                fprintf(fp,'\trank%d\t',k);
                                        end
                                    end
                                    end
                                    fclose(fp);
                                    break;
                                otherwise
                                    disp('unknown input please refer to the right inputs');
                                    fprintf('\n codebook number for which you decide your distance');
                                    fprintf('\n 1.32  2.64  3.128');
                                    mydistance = input('enter codebook information regarding distance:');
                                    continue;
                            end
                        end
                        fprintf('\n matching');
                    end
            end
        case 3
            disp('exit');
            break;
        otherwise
            disp('unknown input please refer to the right inputs');
    end
    fprintf('\n what do you want\n 1.training\t2.testing\t3.exit');
    mychoice=input('\n enter the number');
end

