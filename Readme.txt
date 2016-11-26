Documentations is provided as readme files in both /LibSVM-3.21 and /LibSVM-3.21/matlab/

1.) Using LibSVM for MATLAB

Installation
	a.) navigate to PATH_TO_LIBSVM_MATLAB_FOLDER/ and run matlab.
	
Running LBP
	b.) Run the command in matlab
		>>make
		This will comile the mex files. (This is also a good place to understand how mex files work in matlab)

	c.) lbp.m inside libsvm-3.21/matlab/ is the code that takes in an image as input and generates a row vector feature vector.
	d.) getmapping.m folds the lbp and generates a shorter vector. using this improves performance.

		code sequence in matlab
		>> mapping=getmapping.m(8,'u2');
		>>H=lbp(I,1,8,mapping,'nh');
		
		I=image;
		1=radius;
		8=no. of sampled points;
		mapping=variable generated from getmapping(8,'u2');
		nh= normalised histogram;gives better performance;'h' for unnormalised

Training the SVM model (Read the README files for both libsvm and libsvm/matlab/)
	e.)model=SVMtrain(Y,X, '-c value -t kernel -g gamma -h shrinksomething -v cross validation')

		X is the training matrix. It is sparse and double. Each row is a feature. Number of rows is number of points. Y is a column vector of X.

		Read the documentation for more information about parameters.

	f.)[predict_label, accuracy, dec_values] = svmpredict(Y_test, X_test, model);

		X_test and Y-test are similar to Y and X but for test data. IF you dont have test data, libsvm allows you to chalk out 30% any any amount of training data to be test data. Read the documentation.