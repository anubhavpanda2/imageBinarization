img=imread('img3.jpg');
i2 = rgb2gray(img);
%imshow(img);
[r,co] = size(i2);
alpha=(std2(i2)/128)^0.004;


k=graythresh(i2);
ctr=1;
for i=1:r-2
    for j=1:co-2
         b=i2(i:i+2,j:j+2);
        imin(ctr)=(min(min(b)));
        imax(ctr)=(max(max(b)));
        c=im2double(imax(ctr)-imin(ctr))/im2double(imax(ctr)+imin(ctr));
        ca(ctr)=alpha*c+(1-alpha)*im2double(imax(ctr)-imin(ctr))/im2double(imax(ctr));
        
      %  ca(ctr);
        ctr=ctr+1;
    end
end
mmin=mean2(imin);
mmax=mean2(imax);
mean=(mmax+mmin)/2.0;
cam=mean2(ca)+0.200;
%imshow(i2);
ctr=1;
for i=1:r-2
    
    for j=1:co-2
       % disp('anubhav panda');
          b=i2(i:i+2,j:j+2);
        imin(ctr)=(min(min(b)));
        imax(ctr)=(max(max(b)));
        c=im2double(imax(ctr)-imin(ctr))/im2double(imax(ctr)+imin(ctr));
        ca1=alpha*c+(1-alpha)*im2double(imax(ctr)-imin(ctr))/im2double(imax(ctr));
      %  ca(ctr);
        ctr=ctr+1;
        if(ca1>cam)
          %  disp('anubhav panda');
            if(i2(i,j)<mmax)
                i2(i,j)=255;
            end
        else
           % disp('anubhav pandaabc');
            i2(i,j)=0;
        end
    end
end

i1 = im2bw(i2, graythresh(i2));
edg = edge(i1,'canny');
a=0;
m=0;
for i=1:r
    for j=1:co-1
        if(edg(i,j)==0 && edg(i,j+1)==1)
           % disp('Anubhav');
           m=i1(i,j+1);
           
           a=a+1;
        end
        if(i1(i,j+1)<m)
            i1(i,j+1)=0;
        end
    end
end
for i=1:497
    arr(i)=0;
end
%disp('anubhav1');
%arr
%disp('anubhav1');
for i=1:r
    for j=1:co-1
        cmp=i1(i,j);
        for k=j+1:co-1
            b1=j;
            if cmp==i1(i,k)
                arr(k-b1)=arr(k-b1)+1;
                break;
            end
        end
    end
end
%arr
i1=not(i1);
imshow(i1);
%imshow(i2);
mmin
mmax
mean
cam