img=imread('img2.jpg');
i2 = rgb2gray(img);
%imshow(img);
[r,c] = size(i2);
for i=1:r
    for j=1:c
        i2(i,j)=255;
    end
end
imshow(i2);