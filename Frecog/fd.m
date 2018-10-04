%% input image


[fname,path]= uigetfile('.pgm','open a input trainning face');
fname= strcat(path,fname);
im= imread(fname);
imshow(im);
title('input face');
c= input('enter the class');

%%feature extraction

F=fd_mod(im);

try
    load db;
    F= [F c];
    db= [db;F];
    save db.mat db
    
catch
    db=[F c];
    save db.mat db
end    
    