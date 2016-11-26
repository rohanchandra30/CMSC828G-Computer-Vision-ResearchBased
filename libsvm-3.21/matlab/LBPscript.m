
load data_batch_1.mat;
mapping=getmapping(20,'u2');
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
W_1=W;
L_1=labels;

load data_batch_2.mat;
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
W_2=W;
L_2=labels;

load data_batch_3.mat;
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
W_3=W;
L_3=labels;

load data_batch_4.mat;
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
W_4=W;
L_4=labels;

load data_batch_5.mat;
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
W_5=W;
L_5=labels;    

X=[W_1;W_2;W_3;W_4;W_5];
X=sparse(X);
Y=[L_1;L_2;L_3;L_4;L_5];
Y=double(Y);
load test_batch.mat;

for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,2.5,20,mapping,'nh');
end
X_test=W;
Y_test=labels;
Y_test=double(Y_test);

model = svmtrain(Y, X, '-c 500 -t 0 -h 0 ');
[predict_label, accuracy, dec_values] = svmpredict(Y_test, X_test, model);