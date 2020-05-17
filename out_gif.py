from PIL import Image, ImageDraw

s=72
#N=20
#RATE = 11025
#fr = RATE
#fn=51200*N/50  #*RATE/44100
#fs=fn/fr
#list=[0.1,0.3,0.5,0.7,0.9,0.99,0.999,0.9999,1] #yousei
#list=[0.1,0.3,0.5,0.7,0.9,0.99,0.999,0.9999,1] #insei
list=[0.3,0.5,0.7,0.9,0.99,0.995,0.999,1] #insei
#list=[2,3,4,5,6,7,8,9,10]
images = []
for i in list: #range(0,360,5):
    #im = Image.open('./yousei/yousei_'+str(i)+'_c(0.7,0.8,0.95,0.99,0.999,0.9999,1).jpg') 
    im = Image.open('./insei/kando_var/insei_a=c(0.7,0.8,0.95,0.99,0.999,0.9999,1)_'+str(i)+'.jpg')
    im =im.resize(size=(512, 512), resample=Image.NEAREST)  #- NEAREST - BOX - BILINEAR - HAMMING - BICUBIC - LANCZOS
    images.append(im)
    
images[0].save('./insei/kando_var/insei.gif', save_all=True, append_images=images[1:s], duration=200*5, loop=0)    
