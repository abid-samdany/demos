%%classifier

[fname,path]= uigetfile('.pgm','provide a face for test');
fname= strcat(path,fname);
im= imread(fname);
imshow(im);
title('find face');

%%find the match 

Ftest=fd_mod(im);

%%comparison with databasedb

load db.mat
Ftrain = db(:,1:2);
Ctrain= db(:,3);

for i=1:size(Ftrain,1)
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end

m= find(dist==min(dist),1);
det_class= Ctrain(m);

msgbox(strcat('Detected class=',num2str(det_class)));

