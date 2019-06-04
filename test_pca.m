%%% PCA Example based on 
%%http://www.cs.otago.ac.nz/cosc453/student_tutorials/principal_components.pdf

x = [2.5 0.5 2.2 1.9 3.1 2.3 2.0 1.0 1.5 1.1]
y = [2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9]

ux = mean(x)
uy = mean(y)

xp = x - ux
yp = y - uy

result = [xp', yp']

mcov = cov(result)

[eig_vectors, eig_values] = eig(mcov)

% For some reason the eigen vectors differs in sign from the document where
% I am follow this example, so to get the same values I am changing the
% sign

Feature_Vector = [ -eig_vectors(1,2) -eig_vectors(2,2) ; eig_vectors(1,1) eig_vectors(2,1) ]

Final_Data_1 = (Feature_Vector')*(result')

TransformedData = Final_Data_1'

scatter(TransformedData(:,1), TransformedData(:,2))

RowDataAjust = (inv(Feature_Vector'))*Final_Data_1

%considering only one 

Feature_Vector_1D = [ -eig_vectors(1,2) -eig_vectors(2,2) ]
Final_Data_1D = (Feature_Vector_1D)*(result')



RowDataAjust_1D = (Feature_Vector_1D')*Final_Data_1D


% Now using the command of MATLAB princomp(X)

X = result

[COEFF,SCORE, latent] = princomp(X);


% Now doing it by hand :)

%eigen values
lambda_1 = 1.2840
lambda_2 = 0.0491

%eigen vectors

EigVector_1 = [0.6779;0.7352]
EigVector_2 = [-0.7351;0.6779]

EigVector = [EigVector_1 EigVector_2]

% Computing the PCA

Feature_Vector = EigVector;

Final_Data_1 = (Feature_Vector')*(result')

TransformedData = Final_Data_1'

scatter(TransformedData(:,1), TransformedData(:,2))

RowDataAjust_m = (inv(Feature_Vector'))*Final_Data_1

%considering only one 

Feature_Vector_1D = EigVector_1;
Final_Data_1D_m = (Feature_Vector_1D)*(result')



RowDataAjust_1D_m = (Feature_Vector_1D')*Final_Data_1D



