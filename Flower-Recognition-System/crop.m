clear all;
clc;
no_of_class = 4;
no_of_sample = 30;
total_char = no_of_class * no_of_sample;
Source = 'C:\Users\nikhi\project\Flower-Recognition-System\bw img\'; 
Source1 = 'C:\Users\nikhi\project\Flower-Recognition-System\crop img\'; 
for i=1:no_of_class,
    for j=1:no_of_sample,
        char_Path = '';
        char_Path  = strcat(Source,int2str(i),'\',int2str(j),'.jpg');
        char_Image = imread(char_Path);
        char_Image = rgb2gray(char_Image);
        char_Image = im2bw(char_Image);
        

        newimagename = [Source1,int2str(i),'\',int2str(j),'.jpg'];
        imwrite(char_Image, newimagename);
       
    end
end 
