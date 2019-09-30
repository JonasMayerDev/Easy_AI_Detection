import os 
import sys

if not sys.argv[1][0] == "/":
    path = sys.path[0]+"/"+sys.argv[1]
else:
    path = sys.argv[0]
print(sys.argv[1])
print(path[-1])

if not path[-1]== "/":
    path = path + "/"


images = os.listdir(path)
i=0
for image in images:
    if i in range(int(len(images)*0.1)):
        
        os.rename(path+image,sys.path[0]+"/models/research/object_detection/test/"+image)
        i=i+1
    else:
        os.rename(path+image,sys.path[0]+"/models/research/object_detection/train/"+image)



