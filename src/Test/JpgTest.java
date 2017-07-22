package Test;

import java.io.File;
import java.io.IOException;

import java.io.FileOutputStream;

import java.awt.Graphics;

import java.awt.Image;

import java.awt.image.BufferedImage;

import com.sun.image.codec.jpeg.JPEGCodec;

import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class JpgTest {
public void JpgChange(String Bigpath,String Smallpath) throws Exception{
	java.io.File f=new java.io.File(Smallpath);
	if (!f.exists()) {
        try {
            f.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
File _file = new File(Bigpath);//读入文件
Image src = javax.imageio.ImageIO.read(_file);//构造Image对象
int wideth=src.getWidth(null); //得到源图宽
int height=src.getHeight(null); //得到源图长
BufferedImage tag = new BufferedImage(285,261,BufferedImage.TYPE_INT_RGB);
tag.getGraphics().drawImage(src,0,0,285,261,null); //绘制缩小后的图
FileOutputStream out=new FileOutputStream(Smallpath); //输出到文件流
JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
encoder.encode(tag); //近JPEG编码
out.close();

}
   }
