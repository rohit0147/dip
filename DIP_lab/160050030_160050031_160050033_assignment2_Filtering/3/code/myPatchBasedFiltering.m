function [] = myPatchBasedFiltering(filename,ss,si, i)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
load(filename);
if i==1
    im1=imageOrig;
elseif i==2
    im1=imgCorrupt;
end

load(filename)
% im1 = imageOrig;
if i == 1
   im1 = imageOrig;
elseif i == 2
    im1 = imgCorrupt;
end
%calculate range
max1 = max(max(im1));
min1 = min(min(im1));
range1 = max1 - min1;

%size
[row1,col1] = size(im1);

%corrupting image with gaussian noise with std dev = 5% of range
corrupt_im1 = normrnd(im1,0.05*range1);

%initialize new image
new_im1 = zeros(row1,col1);

windows=25;
patchs=9;

w=(windows-1)/2;
p=(patchs-1)/2;

for i=1:row1
    if((i-w)>=1)
        iwmin=i-w;
    else
        iwmin=1;
    end
    if((i+w)<=row1)
        iwmax=i+w;
    else
        iwmax=row1; 
    end
    
    if((i-p)>=1)
        ipmin=i-p;
    else
        ipmin=1;
    end
    if((i+p)<=row1)
        ipmax=i+p;
    else
        ipmax=row1;
    end
    
    for j=1:col1
        if((j-w)>=1)
            jwmin=j-w;
        else
            jwmin=1;
        end
        if((j+w)<=col1)
            jwmax=j+w;
        else
            jwmax=col1; 
        end
    
        if((j-p)>=1)
            jpmin=j-p;
        else
            jpmin=1;
        end
        if((j+p)<=col1)
            jpmax=j+p;
        else
            jpmax=col1;
        end
        
        % patch((ipmin))=im1(ipmin:ipmax, jpmin:jpmax);

        % for ip1=ipmin:ipmax
        %     for jp1=jpmin:jpmax
        %         patch((ip1-ipmin+1),(jp1-jpmin+1))=im1(ip1,jp1);

        %     end
        % end
        
        for iw=iwmin:iwmax
             if((iw-p)>=1)
                ipmin1=iw-p;
             else
                ipmin1=1;
             end
             if((iw+p)<=row1)
                ipmax1=iw+p;
             else
                ipmax1=row1;
             end
             
             for jw=jwmin:jwmax
                if((jw-p)>=1)
                    jpmin1=jw-p;
                else
                    jpmin1=1;
                end
                if((jw+p)<=col1)
                    jpmax1=jw+p;
                else
                    jpmax1=col1;
                end
                % (1:ipmax-ipmin+1, 1:jpmax-ipmin+1)
                % (1:ipmax1-ipmin1+1,1:jpmax1-jpmin1+1)
                patch1=im1(i-(iw-ipmin1):i+(ipmax1-iw), j-(jw-jpmin1):j+(jpmax1-jw));
                patch2=im1(ipmin1:ipmax1,jpmin1:jpmax1);

                patch3=patch1-patch2;

                

                % for ip2=ipmin1:ipmax1
                %     for jp2=jpmin1:jpmax1
                %         patch2((ip2-ipmin1+1),(jp2-jpmin2+1))=im1(ip2,jp2);
                %     end
                % end
                

                
        
end