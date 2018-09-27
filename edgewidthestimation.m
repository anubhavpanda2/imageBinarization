img=imread('img1.jpg');
i2 = rgb2gray(img);
%imshow(i1);
alpha=std2(i2)/128;

 imin1=min(min(i2));
        imax1=max(max(i2));
        dif=imax1-imin1;
i2=i2(1:294,1:498);
for i=1:1:292
    for j=1:1:496
        b=i2(i:i+2,j:j+2);
        imin=(min(min(b)));
        imax=(max(max(b)));
       
        a1 = typecast(imin,'int8')+127;
        a2=typecast(imax,'int8')+127;
        a3min=int16(a1)+127+2;
        a3max=int16(a2)+127+2;
        
        a=double(imin)/double(a3min+a3max+20);
        k=double(imax)/double(a3min+a3max);
      %  disp('Anubhav123');
       
        %disp('Anubhav123');
       i2(i:i+2,j:j+2)=imadjust(b,[a 1],[],4.5);
       % c=(imax-imin)/(imax+imin);
        %c
        %ca=alpha*c+(1-alpha)*(imax-imin);
        
        %imax
        %imin
        %disp('Anubhav123');
        %ca
        %disp('Anubhav123');
        %b=imcontrast(ca);
       % for k=0:2
        %    for y=0:2
               
         %   end
        %end
    end
end
%i2= imadjust(i2);
i1 = im2bw(i2, graythresh(i2));
%imshow(i1);
edg = edge(i1,'canny');
a=0;
m=0;
for i=1:294
    for j=1:497
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
disp('anubhav1');
%arr
disp('anubhav1');
for i=1:294
    for j=1:497
        cmp=i1(i,j);
        for k=j+1:497
            b1=j;
            if cmp==i1(i,k)
                arr(k-b1)=arr(k-b1)+1;
                break;
            end
        end
    end
end
disp('anubhav');
alpha
dif
%arr
imshow(i1);
%for k=1:499
  %o=1:499
  %plot(o,arr);
%end
%imshow(i1);
%processing procedure
