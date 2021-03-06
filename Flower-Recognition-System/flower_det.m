
clear all;
     clc;

     DatabasePath = 'C:\Users\nikhi\project\Flower-Recognition-System\crop img\';
     NumberOfClasses = 4;
     NumberOfSamplesPerClass = 30;
     NumberOfTrainingSamples = 20;
     NumberOfTestingSamples = NumberOfSamplesPerClass - NumberOfTrainingSamples;
     ClasswiseLbpFeatures = []; 
     for index1 = 1 : NumberOfClasses            
         for index2 = 1 : NumberOfSamplesPerClass 
             % per class
             Image = imread(sprintf('%s%d\\%d.jpg',DatabasePath, index1, index2));
             % Extract uniform lbp Features
               LbpFeatures(index2,:)=extractLBPFeatures(Image);
               
                
         end
         
            
         ClasswiseLbpFeatures= cat(1,ClasswiseLbpFeatures,LbpFeatures);
     end
     
      k = 1;
      k1 = 1;
      k2 = 1;
      NumberOfFeaturesLbp = size(ClasswiseLbpFeatures,2);
   
      for index1 = 1 : NumberOfClasses
         for index2 = 1 : NumberOfTrainingSamples
             TrainingSetLbp(k1,1:NumberOfFeaturesLbp) = ClasswiseLbpFeatures(k,:);        
              TrainingSetLbp(k1,NumberOfFeaturesLbp+1)=index1;
              
              
             
    
              k = k + 1;
              k1 = k1 + 1;
          end
          for index2 = 1 : NumberOfTestingSamples
              TestingSet(k2,:) = ClasswiseLbpFeatures(k,:);

              k = k + 1;
                        k2 = k2 + 1;
          end
      end
     
     [Label] = KNN(TrainingSetLbp,TestingSet,2,3);

      Label1 = [];
     for index1 = 1 : NumberOfClasses
         Label1 = cat(1,Label1, ones(NumberOfTestingSamples,1)*index1);    
     end
     
     TempLbp = (Label-Label1);

     
     
     Accuracy = ((size(find(TempLbp == 0),1))/(NumberOfClasses*NumberOfTestingSamples))*100;
