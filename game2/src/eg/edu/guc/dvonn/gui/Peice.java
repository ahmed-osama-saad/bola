package eg.edu.guc.dvonn.gui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.Ellipse2D;

import javax.swing.JLabel;

public class Peice extends JLabel{
	int color;
	int h;
	boolean has;
	
	
	public Peice(int color,int height, boolean hasRed){
		super();
		this.color = color;
		h = height;
		has = hasRed;
	}
	public Peice(int r , int c){
		super();
		color = 5;
		h = 0;
		has = false;	
	}
	public void paintComponent(Graphics g){
		Graphics2D g2 = (Graphics2D)g;
		Ellipse2D tire = new Ellipse2D.Double(10, 20, 40, 40);
		Ellipse2D gap = new Ellipse2D.Double(20, 30, 20, 20);
		g2.draw(tire);
		
		if(color == 5){
			g2.setPaint(Color.GRAY);
			g2.fill(tire);
		}
		else{
			if(color == 0) g2.setPaint(Color.RED);
		
		else{
			if(color == 1) g2.setPaint(Color.WHITE);
			else g2.setPaint(Color.BLACK);
		}
		g2.fill(tire);
		if(has == true) g2.setPaint(Color.RED);
		else g2.setPaint(Color.GRAY);
		g2.draw(gap);
		g2.fill(gap);
		g2.setColor(Color.black);
		g2.drawString(h+"", 27, 45);
		}
	}
	}

