import sys
sys.path.append("/home/jonas/Dokumente/Easy_AI_Detection")
import Easy_AI_Detection as EAID
#import numpy as np
#from matplotlib import pyplot as plt
#from matplotlib import cm
from PIL import Image


E_AI_D = EAID.Easy_AI_Detection()

(Boxes,img) = E_AI_D.classify_image("/home/jonas/Dokumente/Easy_AI_Detection/img0.png",True)
(Boxes2,img2) = E_AI_D.classify_image("/home/jonas/Dokumente/Easy_AI_Detection/img1.png",True)

#img = img[int(Boxes[0][1]),int(Boxes[0][3])][int(Boxes[0][0]):int(Boxes[0][2])]

Image.fromarray(img).show()
Image.fromarray(img2).show()

#Boxes is an Array with [[left,top,right,bottom,class,score],[]]

print(Boxes)

print(Boxes2)



