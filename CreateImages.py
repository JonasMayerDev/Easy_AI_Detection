import cv2
import face_recognition
import sys

if not len(sys.argv) >2:
    print("Please Add a Name z.B. jonas,lisa,marlon etc \n And add True if you want to make many picturs with diffrent name\n Or False if you want to take only One Image")
    exit(0)

Video = cv2.VideoCapture(0)

i = 0

while True:
    res,image = Video.read()
    if res == True:
        cv2.imshow("Press P to take Image",image)
        if cv2.waitKey(1) == ord("p"):

            

            if(sys.argv[2] == "False"):
                print("Start Save Image")
                erfolgreich = cv2.imwrite(sys.path[0]+"/"+str(sys.argv[1])+".png",image)
                print(str(erfolgreich)+" Save Image")
            else:
                print("Start Save Image")
                erfolgreich = cv2.imwrite(sys.path[0]+"/"+str(sys.argv[1])+str(i)+".png",image)
                print(str(erfolgreich)+" Save Image")
                i = i+1
