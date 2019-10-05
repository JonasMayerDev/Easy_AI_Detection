import sys
sys.path.append("PATH THO THE Eeasy_AI_Detection.py file normaly in the repo folder")
import Easy_AI_Detection as EAID
from PIL import Image

# Create instance
E_AI_D = EAID.Easy_AI_Detection()

#Classify Image 

(Boxes,img) = E_AI_D.classify_image("PATH TO FILE OR CV2 IMAGE OR PIL IMAGE IF ITS A NUMPY IMAGE SET TO FALSE",True)


#img = img[int(Boxes[0][1]),int(Boxes[0][3])][int(Boxes[0][0]):int(Boxes[0][2])]

Image.fromarray(img).show()


#Boxes is an Array with [[left,top,right,bottom,class,score],[]]

print(Boxes)



