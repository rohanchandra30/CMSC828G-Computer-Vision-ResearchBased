load test_batch.mat;
mapping=getmapping(8,'u2');
for i=1:10000
    image1=data(i,:);
    I=reshape(image1,32,32,3);
    W(i,:)=lbp(I,1,8,mapping,'h');
end
W_test=W;
labels_test=labels;