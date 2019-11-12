# Easy_AI_Detection 
A easy and fast custom Object Detection installer based on Tensorflow Object Detection API for Linux  (Needs Root)

Clone the Repo:
git clone https://github.com/BySuxax/Easy_AI_Detection


Step by Step:

1. type in console: InstallAllLibarys.bash and awnser the questions


2. when the gedit window open: type in the number of clases you want to detect at num_classes: and save it!


3. when LabelImage window opened;  Open the train folder (yourDir/models/research/object_detection/train) with "Open Dir" button: 


4. When Window has opened with the images start drawing rectangels(with w), type class names and save it. repeat it for every image in train! 


5. Then open the test folder and select the test folder(yourDir/models/research/object_detection/test) with "Open Dir" button: 


6. When Window has opened with the images start drawing rectangels(with w), type class names and save it. repeat it for every image in test! 


7. when gedit window opened, Add to:         AND SAVE!

def class_text_to_int(row_label):  
    if row_label == 'YOUR_LABEL1':
        return 1 
        #Past Here
    else:
        None    

for every label a:

    elif row_label == 'YOUR_LABEL_NAME':
        return 2  


8.  please enter in the following shema. Per item you want to detect: AND SAVE!

    id rising up starts at 1
    name = name you labeled it

item{
  id: 1
  name: 'YOR_FIRST_LABEL'
}



9. Now the training should start. Wait till the loss avrage is under 0.5/0.4 then press Strg+C


10. run in Terminal first cd ../../../ and then . Create_Graph.bash LAST_SAVED_CHECKPOINT_NUM


11. Now you can use the Test1.py file to test the training. If you want to us it in a outher project you can use the file but you have to change the sys.path.appand("YOUR path to the Easy_AI_Detection.py file in the repo") 

HAVE FUN!
     


#########################################################################
QUELLE: https://github.com/datitran/raccoon_dataset, https://github.com/tensorflow/tensorflow, https://github.com/tzutalin/labelImg, 
        https://www.youtube.com/watch?v=COlbP62-B-U&list=PLQVvvaa0QuDcNK5GeCQnxYnSSaar2tpku&index=1 

LICENSES: 1. xml_to_css.py,generate_tfrecord.py ./LICENSE_raccoon_dataset 2. tensorflow ./models/LICENSE 3. labelImg ./models/research/object_detection/labelImg/LICENSE
          4. Easy_AI_Detection ./LICENSE

Thanks to: datitran, tensorflow, tzutalin, sentdex
